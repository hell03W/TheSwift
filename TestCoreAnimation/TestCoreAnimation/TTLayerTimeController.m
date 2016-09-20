//
//  TTLayerTimeController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/18.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTLayerTimeController.h"

@interface TTLayerTimeController ()

@property (nonatomic, strong) UIImageView *plane;

@end

@implementation TTLayerTimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图层时间";
    
    [self pathAnimation];
    [self controlAnimation];
    [self controlAnimation2];
}


// 关键帧动画,
- (void)pathAnimation {
    
    // 使用贝塞尔画曲线
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    [bPath moveToPoint:CGPointMake(30, 150)];
    [bPath addCurveToPoint:CGPointMake(350, 150) controlPoint1:CGPointMake(100, 50) controlPoint2:CGPointMake(250, 300)];
    
    
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
    _plane = plane;
    
    
    // 创建path动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = bPath.CGPath;
    keyAnimation.duration = 5.f;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    [plane.layer addAnimation:keyAnimation forKey:nil];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self pathAnimation];
}

/**
 *  手动动画
 */
- (void)controlAnimation {
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureChanged:)];
    [self.view addGestureRecognizer:panGesture];
    
    self.plane.layer.speed = 0.0;
}

- (void)panGestureChanged:(UIPanGestureRecognizer *)pan {
    
    //获取拖拽在x轴上的变化
    float x = [pan translationInView:self.view].x;
    // 换算成时间偏移的单位
    x = x / 60;
    
    CFTimeInterval timeOffset = self.plane.layer.timeOffset;
    
    //限制timeOffset, 最小是0, 最大是2.999
    timeOffset = MIN(2.999, MAX(0.0, timeOffset + x));
    //给layer设置时间偏移量
    self.plane.layer.timeOffset = timeOffset;
    //初始化偏移量为0, 
    [pan setTranslation:CGPointZero inView:self.view];
}



/**
 *  动画的暂停, 回放,
 */
- (void)controlAnimation2 {
    
    UIButton *backBtn = [UIButton buttonWithType:0];
    [self.view addSubview:backBtn];
    [backBtn setTitle:@"<" forState:0];
    [backBtn setTitleColor:[UIColor whiteColor] forState:0];
    backBtn.frame = CGRectMake(50, 300, 50, 30);
    backBtn.backgroundColor = [UIColor grayColor];
    backBtn.tag = -1;
    [backBtn addTarget:self action:@selector(btnClicked:) forControlEvents:64];
    
    
    UIButton *pauseBtn = [UIButton buttonWithType:0];
    [self.view addSubview:pauseBtn];
    [pauseBtn setTitle:@">||" forState:0];
    [pauseBtn setTitleColor:[UIColor whiteColor] forState:0];
    pauseBtn.frame = CGRectMake(120, 300, 50, 30);
    pauseBtn.backgroundColor = [UIColor grayColor];
    pauseBtn.tag = 0;
    [pauseBtn addTarget:self action:@selector(btnClicked:) forControlEvents:64];
    
    
    UIButton *forwardBtn = [UIButton buttonWithType:0];
    [self.view addSubview:forwardBtn];
    [forwardBtn setTitle:@">" forState:0];
    [forwardBtn setTitleColor:[UIColor whiteColor] forState:0];
    forwardBtn.frame = CGRectMake(190, 300, 50, 30);
    forwardBtn.backgroundColor = [UIColor grayColor];
    forwardBtn.tag = 1;
    [forwardBtn addTarget:self action:@selector(btnClicked:) forControlEvents:64];
    
    
    self.plane.layer.speed = 0.5;
}

- (void)btnClicked:(UIButton *)sender {
    
    if (sender.tag == 0) {
        CFTimeInterval pauseTime = [self.plane.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        
//        self.plane.layer.timeOffset = pauseTime;
//        self.plane.layer.speed = 0;
        [self pauseLayer:self.plane.layer];
    }else{
        
//        CFTimeInterval pauseTime = self.plane.layer.timeOffset;
//        self.plane.layer.speed += (float)sender.tag / 10.f;
////        self.plane.layer.timeOffset = 0.0;
//        self.plane.layer.beginTime = 0.0;
//        
////        CFTimeInterval timeSincePause =  CACurrentMediaTime() - pauseTime;
//        CFTimeInterval timeSincePause = [self.plane.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pauseTime;
//        self.plane.layer.beginTime = timeSincePause;
//        
//        NSLog(@"timeSincePause: %lf", timeSincePause);
        
        
//        CFTimeInterval pausedTime = [self.plane.layer timeOffset];
//        self.plane.layer.speed = 0.2;
//        self.plane.layer.timeOffset = 0.0;
//        self.plane.layer.beginTime = 0.0;
//        CFTimeInterval timeSincePause = [self.plane.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
//        self.plane.layer.beginTime = timeSincePause;
        
        
        [self resumeLayer:self.plane.layer];
    }
    
    NSLog(@"%f", self.plane.layer.speed);
}


#warning mark - 以下代码是从网上找的, 但是也存在问题, 当layer的speed不是1时候, 继续动画会出问题.
- (void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}


//继续layer上面的动画
- (void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 0.5;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}




@end












