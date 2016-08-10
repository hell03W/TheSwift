//
//  TTTransformController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/10.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTTransformController.h"

@interface TTTransformController ()

@end

@implementation TTTransformController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"变换";
}

- (void)configUI {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 50, 100)];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor redColor];
    
#pragma mark - 仿射变换
    //1. 旋转
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    
    //仿射变换, 在视图上可以通过设置 transform 实现, 在图层上可以通过 arrineTransform 实现.
//    bgView.transform = transform;
//    bgView.layer.affineTransform = transform;
    
    //2. 缩放
//    CGAffineTransform transform = CGAffineTransformMakeScale(0.5, 2.0);
    
    //3. 平移
//    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 100);
    
    //4. 倾斜(剪切)变换
//    CGAffineTransform transform = CGAffineTransformMakeShear(0, -1);
    
    
    
//    bgView.transform = transform;
    
    
    //
#pragma mark - 3D变换
    
    
    //2.1 旋转
//    CATransform3D transform3d = CATransform3DMakeRotation(M_PI_4, 1, 0, 0);
    
    //2.2 缩放  但是z轴上的缩放是什么鬼 ?
//    CATransform3D transform3d = CATransform3DMakeScale(2, 1, 1);
    
    //2.3 平移
//    CATransform3D transform3d = CATransform3DMakeTranslation(100, 100, 0);
    
    //2.4 透视投影  测试证明,必须先设置m34的值, 然后再设置旋转角度, 这样才会有透视投影的效果
    //create a new transform
    CATransform3D transform3d = CATransform3DIdentity;
    //apply perspective
    transform3d.m34 = - 1.0 / 500.0;
    //rotate by 45 degrees along the Y axis
    transform3d = CATransform3DRotate(transform3d, M_PI_4, 0, 1, 0);
    
    
    transform3d.m34 = -1 / 500.0;
    
    bgView.layer.transform = transform3d;
    
}


/// 倾斜倾斜变换的实现
CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y)
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

@end
