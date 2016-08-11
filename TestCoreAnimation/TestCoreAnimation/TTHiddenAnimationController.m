//
//  TTHiddenAnimationController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/11.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTHiddenAnimationController.h"

#import "TTChangeColor.h"

@interface TTHiddenAnimationController ()

@property (nonatomic, strong) CALayer *moveLayer;

@end

@implementation TTHiddenAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"隐式动画";
}


- (void)configUI {
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    TTChangeColor *changeColor = [[TTChangeColor alloc] initWithFrame:CGRectMake(10, 100, 150, 150)];
    [self.view addSubview:changeColor];
    changeColor.backgroundColor = [UIColor whiteColor];
    
    
    
    // 测试 layer的presentationLayer属性
    self.moveLayer = [CALayer layer];
    self.moveLayer.backgroundColor = [UIColor redColor].CGColor;
    self.moveLayer.frame = CGRectMake(200, 100, 80, 80);
    [self.view.layer addSublayer:self.moveLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    if ([self.moveLayer.presentationLayer hitTest:point]) {
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        
        [CATransaction begin];
        [CATransaction setAnimationDuration:1];
        self.moveLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
        [CATransaction commit];
    }else{
        [CATransaction begin];
        [CATransaction setAnimationDuration:4];
        self.moveLayer.position = point;
        [CATransaction commit];
    }
}

@end
