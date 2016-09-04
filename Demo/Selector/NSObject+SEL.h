//
//  NSObject+SEL.h
//  Selector
//
//  Created by Mekor on 16/9/4.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SEL)
-(id)performSelector:(SEL)selector withObjects:(NSArray *)objects;
@end
