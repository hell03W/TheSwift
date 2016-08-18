//
//  TTDisplayAnimationController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/18.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTDisplayAnimationController.h"
#import <QuartzCore/QuartzCore.h>

@interface TTDisplayAnimationController ()

@end

@implementation TTDisplayAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"显示动画";
}


- (void)configUI {
    
    
    
}

// 基础动画, 改变颜色
- (void)changeColor {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 80, 80)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.fromValue = (__bridge id) view.layer.backgroundColor;
    animation.toValue = (__bridge id)[UIColor purpleColor].CGColor;
    animation.duration = 3;
    animation.delegate = self;
    [view.layer addAnimation:animation forKey:nil];
    
//    view.backgroundColor = [UIColor purpleColor];
    animation.fillMode = kCAFillModeBoth;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self changeColor];
}



/* Called when the animation begins its active duration. */

- (void)animationDidStart:(CAAnimation *)anim {
    
    NSLog(@"animation start");
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"animation finish");
}

@end
