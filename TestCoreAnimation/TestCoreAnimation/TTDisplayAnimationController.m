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

@property (nonatomic, strong) UIView *colorView;

@end

@implementation TTDisplayAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"显示动画";
}


- (void)configUI {
    
    
    
}

- (UIView *)colorView {
    
    if (!_colorView) {
        UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(150, 70, 80, 80)];
        [self.view addSubview:colorView];
        colorView.backgroundColor = [UIColor grayColor];
        _colorView = colorView;
    }
    return _colorView;
}

// 1. 基础动画, 改变颜色
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
    
    view.backgroundColor = [UIColor purpleColor];
    animation.fillMode = kCAFillModeBoth;
    
}

// 2. 关键帧动画, 使用颜色数组改变颜色
- (void)keyFrameAnimationChangeColor {
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    keyAnimation.duration = 7;
    
    keyAnimation.values = @[(__bridge id)self.colorView.backgroundColor.CGColor,
                            (__bridge id)[UIColor blueColor].CGColor,
                            (__bridge id)[UIColor redColor].CGColor,
                            (__bridge id)[UIColor blackColor].CGColor,
                            (__bridge id)[UIColor purpleColor].CGColor,
                            (__bridge id)[UIColor cyanColor].CGColor,
                            (__bridge id)[UIColor yellowColor].CGColor];
    [self.colorView.layer addAnimation:keyAnimation forKey:nil];
    
    self.colorView.layer.backgroundColor = [UIColor yellowColor].CGColor;
}


// 3. 关键帧动画,
- (void)pathAnimation {
    
    // 使用贝塞尔画曲线
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    [bPath moveToPoint:CGPointMake(30, 250)];
    [bPath addCurveToPoint:CGPointMake(350, 250) controlPoint1:CGPointMake(100, 150) controlPoint2:CGPointMake(250, 400)];
    
    
    // 将曲线添加到shapeLayer上面
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bPath.CGPath;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
    
    
    //创建飞机控件
    UIImageView *plane = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    plane.center = CGPointMake(30, 150);
    plane.backgroundColor = [UIColor blueColor];
    [self.view addSubview:plane];
    
    
    // 创建path动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = bPath.CGPath;
//    keyAnimation.duration = 3.f;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    
    
    
    
    
    
    
    // 改变颜色的动画
    CAKeyframeAnimation *colorAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
//    colorAnimation.duration = 3.f;
    
    colorAnimation.values = @[(__bridge id)self.colorView.backgroundColor.CGColor,
                            (__bridge id)[UIColor blueColor].CGColor,
                            (__bridge id)[UIColor redColor].CGColor,
                            (__bridge id)[UIColor blackColor].CGColor,
                            (__bridge id)[UIColor purpleColor].CGColor,
                            (__bridge id)[UIColor cyanColor].CGColor,
                            (__bridge id)[UIColor yellowColor].CGColor];
    
    
    // animationGroup 代码.
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 3.f;
    animationGroup.animations = @[keyAnimation, colorAnimation];
    
    animationGroup.timeOffset = 1.5;
    
    
    [plane.layer addAnimation:animationGroup forKey:nil];
    
    
    
//    [plane.layer addAnimation:keyAnimation forKey:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self changeColor];
//    [self keyFrameAnimationChangeColor];
    [self  pathAnimation];
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
