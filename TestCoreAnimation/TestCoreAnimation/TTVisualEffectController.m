//
//  TTVisualEffectController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/1.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTVisualEffectController.h"

@interface TTVisualEffectController ()

@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation TTVisualEffectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视觉效果";
}

- (UIView *)layerView {
    
    if (!_layerView) {
        _layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 80, 100, 100)];
        [self.view addSubview:_layerView];
        _layerView.layer.borderWidth = 1;
        _layerView.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _layerView;
}

- (UIView *)maskView {
    
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        [self.view addSubview:_maskView];
        _maskView.layer.borderWidth = 1;
        _maskView.layer.borderColor = [UIColor redColor].CGColor;
    }
    return _maskView;
}

- (void)configUI {
    
    //测试shadowPath属性
    UIImage *image = [UIImage imageNamed:@"account_selected"];
    
//    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    
//    self.layerView.layer.shadowOpacity = 0.6;
//    self.layerView.layer.shadowRadius = 2;
//    self.layerView.layer.shadowOffset = CGSizeMake(0, 3);
////    self.layerView.backgroundColor = [UIColor redColor];
//    
//    UIBezierPath *bPath = [UIBezierPath bezierPathWithRoundedRect:self.layerView.bounds cornerRadius:30];
//    self.layerView.layer.shadowPath = bPath.CGPath;
    
    
    
    //测试mask属性
    CALayer *bgLayer = [CALayer layer];
    bgLayer.backgroundColor = [UIColor redColor].CGColor;
    bgLayer.frame = CGRectMake(0, 0, 100, 50);
    [self.maskView.layer addSublayer:bgLayer];
    
    self.maskView.backgroundColor = [UIColor blueColor];
    CALayer *maskLayer = [CALayer layer];
    maskLayer.contentsGravity = kCAGravityCenter;
    maskLayer.contents = (__bridge id)image.CGImage;
    maskLayer.frame = self.layerView.bounds;
    self.maskView.layer.mask = maskLayer;
    /*
     看到这个属性, 猜测这个属性可以实现的功能:
        1. 文本, 一个文字, 一半一个颜色.
        2. maskView上放个shapeLayer, 有背景色, mask是一个被填充满的layer, 可以通过控制shapeLayer来控制被填充的程度, 这个可以实现很多功能, 比如 进度条, 比如按住开始录音那个动画效果, 等等等等.
     */
//    self.view.backgroundColor = [UIColor grayColor];
//    
//    self.layerView.backgroundColor = [UIColor whiteColor];
//    self.maskView.backgroundColor = [UIColor whiteColor];
//    self.maskView.frame = CGRectMake(0, 0, 50, 50);
//    [self.maskView removeFromSuperview];
//    [self.layerView addSubview:self.maskView];
//    self.maskView.center = self.layerView.center;
//    
//    
//    self.layerView.alpha = 0.5;

    
    
    
}

@end
