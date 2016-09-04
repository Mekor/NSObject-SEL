//
//  ViewController.m
//  Selector
//
//  Created by Mekor on 16/9/4.
//  Copyright © 2016年 李小争. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+SEL.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(goback) withObjects:nil];
    [self performSelector:@selector(gobackWith:) withObjects:@[@"wz"]];
    [self performSelector:@selector(gobackWith:title:) withObjects:@[@"wz",@"标题"]];
    [self performSelector:@selector(gobackWith:title:age:) withObjects:@[@"wz",@"标题",@18]];
    [self performSelector:@selector(gobackWith:title:age:) withObjects:@[@"wz",[NSNull null],@18]];
}

- (void)goback {
    NSLog(@"%s",__func__);
}

- (void)gobackWith:(NSString *)name {
    NSLog(@"%s",__func__);
}

- (void)gobackWith:(NSString *)name title:(NSString *)title{
    NSLog(@"%s",__func__);
}

- (void)gobackWith:(NSString *)name title:(NSString *)title age:(NSNumber*)age{
    NSLog(@"%s",__func__);
}


@end
