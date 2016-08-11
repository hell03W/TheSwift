//
//  TTTransformController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/10.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTTransformController.h"

@interface TTTransformController ()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) NSArray *faces;
@property (nonatomic, strong) UIView *contenterView;

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
    
//    [self testSublayerTransform];
    [self testSolid];
}

#pragma mark - 测试固体
- (void)testSolid {
    
    //
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 1, 0);
    self.contenterView.layer.sublayerTransform = perspective;
    
    CATransform3D transform;
    
    // 1
    UIView *first = self.faces[0];
    transform = CATransform3DMakeTranslation(0, 0, 100);
    first.layer.transform = transform;
    
    //2
    UIView *second = self.faces[1];
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    second.layer.transform = transform;
    
    //3
    UIView *third = self.faces[2];
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    third.layer.transform = transform;
    
    //4
    UIView *forth = self.faces[3];
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    forth.layer.transform = transform;
    
    //5
    UIView *fifth = self.faces[4];
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    fifth.layer.transform = transform;
    
    //6
    UIView *sixth = self.faces[5];
    transform = CATransform3DMakeTranslation(0, 0, -100);
    sixth.layer.transform = transform;
    
    
}

- (UIView *)contenterView {
    
    if (!_contenterView) {
        _contenterView = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_contenterView];
        _contenterView.backgroundColor = [UIColor lightGrayColor];
    }
    return _contenterView;
}

- (NSArray *)faces {
    
    if (!_faces) {
        
        NSMutableArray *faces = [NSMutableArray array];
        NSArray *colors = @[[UIColor redColor], [UIColor greenColor], [UIColor purpleColor], [UIColor orangeColor], [UIColor blueColor], [UIColor cyanColor]];
        
        for (int i = 0; i < 6; i++) {
            
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
            [self.contenterView addSubview:view];
            view.backgroundColor = colors[i];
            view.center = self.contenterView.center;
            
            [faces addObject:view];
            
        }
        _faces = faces;
    }
    return _faces;
}


#pragma mark - 测试通过 sublayerTransform 属性设置统一的灭点
- (void)testSublayerTransform {
    
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 250, 200)];
    [self.view addSubview:bgview];
    bgview.backgroundColor = [UIColor lightGrayColor];
    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = -1 / 500.0;
    
    bgview.layer.sublayerTransform = transform3D;
    
    
    CALayer *leftLayer = [CALayer layer];
    leftLayer.backgroundColor = [UIColor redColor].CGColor;
    [bgview.layer addSublayer:leftLayer];
    leftLayer.frame = CGRectMake(10, 10, 80, 100);
    leftLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    
    CALayer *rightLayer = [CALayer layer];
    rightLayer.backgroundColor = [UIColor redColor].CGColor;
    [bgview.layer addSublayer:rightLayer];
    rightLayer.frame = CGRectMake(CGRectGetWidth(bgview.frame)-90, 10, 80, 100);
    rightLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    
}

#pragma mark - 基本的变换
- (void)baseTransform {
    
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
    
    
    self.bgView.layer.transform = transform3d;
    
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
