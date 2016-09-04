//
//  NSObject+SEL.m
//  Selector
//
//  Created by Mekor on 16/9/4.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "NSObject+SEL.h"

@implementation NSObject (SEL)

-(id)performSelector:(SEL)selector withObjects:(NSArray *)objects {
    
    // 方法签名
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if(signature == nil){
        [NSException raise:@"niubility error" format:@"%@方法找不到",NSStringFromSelector(selector)];
    }
    
    // 利用一个NSInvocation对象包装一次方法调用(方法调用者,方法名,方法参数,方法返回值)
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    // 设置参数
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self/_cmd以外的参数个数
    paramsCount = MIN(paramsCount, objects.count);
    
    
    for( NSInteger i = 0; i<paramsCount; i++) {
        id object = objects[i];
        if([object isKindOfClass:[NSNull class]]) continue;
        
        [invocation setArgument:&object atIndex:i+2];
    }
    
    // 调用方法
    [invocation invoke];
    
    // 获取返回值
    id returnValue = nil;
    if(signature.methodReturnLength) {
        // 有返回值类型,才去获得返回值
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}
@end
