//
//  TTSpecialLayerController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/11.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTSpecialLayerController.h"

#import "TTShapeLayerView.h"
#import "TTReplicatorView.h"

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
    TTReplicatorView *replicatorView = [[TTReplicatorView alloc] initWithFrame:CGRectMake(0, 220, self.view.bounds.size.width/2, 150)];
    [self.view addSubview:replicatorView];
    replicatorView.backgroundColor = [UIColor lightGrayColor];
    
    
    CAReplicatorLayer *rLayer = replicatorView.replicatorLayer;
    
    // 重复次数
    rLayer.instanceCount = 10;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 20, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -20, 0);
    rLayer.instanceTransform = transform;
    
    rLayer.instanceRedOffset = -0.1;
    rLayer.instanceGreenOffset = -0.1;
    rLayer.instanceBlueOffset = 0.1;
    
    
    UIView *subView = [[UIView alloc] init];
    [replicatorView addSubview:subView];
    subView.frame = CGRectMake(rLayer.position.x-10, 10, 20, 20);
    subView.backgroundColor = [UIColor redColor];
    
    CALayer *ssLayer = [CALayer layer];
    ssLayer.backgroundColor = [UIColor whiteColor].CGColor;
    ssLayer.frame = CGRectMake(5, 5, 10, 10);
    [subView.layer addSublayer:ssLayer];
    
    
    
    // 反射
    TTReplicatorView *reflectView = [[TTReplicatorView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(replicatorView.frame)+30, CGRectGetWidth(self.view.frame), 200)];
    [self.view addSubview:reflectView];
    reflectView.layer.borderWidth = 1;
    reflectView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    reflectView.clipsToBounds = YES;
//
    CAReplicatorLayer *reflectLayer = reflectView.replicatorLayer;
    reflectLayer.instanceCount = 2;
    reflectLayer.instanceAlphaOffset = -0.6;
//
    CATransform3D transform2 = CATransform3DMakeTranslation(0, 80, 0);
    transform2 = CATransform3DRotate(transform2, M_PI, 1, 0, 0);
    reflectLayer.instanceTransform = transform2;
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"111.jpg"]];
    [reflectView addSubview:imgView];
    imgView.frame = CGRectMake(20, 60, 100, 80);
    imgView.clipsToBounds = YES;
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    
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
