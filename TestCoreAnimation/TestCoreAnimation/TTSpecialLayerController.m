//
//  TTSpecialLayerController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/11.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTSpecialLayerController.h"

#import "TTShapeLayerView.h"

@interface TTSpecialLayerController ()

@end

@implementation TTSpecialLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"专用图层";
}

- (void)configUI {
    
    
    
    
    
    
    
    
    
    // 测试使用CAShapeLayer绘制圆角
    TTShapeLayerView *shapeView = [[TTShapeLayerView alloc] initWithFrame:CGRectMake(10, 100, 100, 30)];
    [self.view addSubview:shapeView];
    
    
    
    UIRectCorner corners = UIRectCornerBottomRight | UIRectCornerTopLeft;
    CGSize radii = CGSizeMake(15, 15);
    
    UIBezierPath *bPath = [UIBezierPath bezierPathWithRoundedRect:shapeView.bounds byRoundingCorners:corners cornerRadii:radii];
    
    shapeView.shapeLayer.lineWidth = 1;
    shapeView.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeView.shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeView.shapeLayer.path = bPath.CGPath;
    
    
    
    // CAGradientLayer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    // 设置frame大小
    gradientLayer.frame = CGRectMake(120, 100, 100, 100);
    // 设置渐变的颜色  颜色必须用 __bridge id 桥接 CGColor, 否则无效
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor purpleColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor];
    // 设置开始位置
    gradientLayer.startPoint = CGPointMake(0, 0);
    // 设置结束位置
    gradientLayer.endPoint = CGPointMake(1, 1);
    // 设置渐变颜色的位置
    gradientLayer.locations = @[@0.5, @0.75, @1];
    
    
    
    
    // 重复图层
    CAReplicatorLayer *rLayer = [CAReplicatorLayer layer];
    rLayer.frame = CGRectMake(0, 220, self.view.bounds.size.width, 350);
    [self.view.layer addSublayer:rLayer];
    rLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    // 重复次数
    rLayer.instanceCount = 10;
    
    //为每个对象注册一个transform
//    CATransform3D transform = CATransform3DMakeTranslation(30, 0, 0);
//    rLayer.instanceTransform = transform;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 20, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -20, 0);
    rLayer.instanceTransform = transform;
    
    rLayer.instanceRedOffset = -0.1;
    rLayer.instanceGreenOffset = -0.1;
    rLayer.instanceBlueOffset = 0.1;
    
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor whiteColor].CGColor;
//    layer.frame = CGRectMake(10, 10, 20, 20);
    layer.frame = CGRectMake(rLayer.position.x-10, 140, 20, 20);
    [rLayer addSublayer:layer];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
