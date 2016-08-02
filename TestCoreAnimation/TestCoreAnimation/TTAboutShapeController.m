//
//  TTAboutShapeController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/1.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTAboutShapeController.h"

@interface TTAboutShapeController ()

@property (nonatomic, strong) CALayer *greenLayer;
@property (nonatomic, strong) CALayer *redLayer;

@end

@implementation TTAboutShapeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图形几何学";
}

- (void)configUI {
    
    //z 坐标轴
    CALayer *greenLayer = [CALayer layer];
    greenLayer.frame = CGRectMake(10, 70, 100, 100);
    greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    _greenLayer = greenLayer;
    
    CALayer *redLayer = [CALayer layer];
    redLayer.frame = CGRectMake(60, 130, 100, 100);
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.cornerRadius = 50;
    redLayer.masksToBounds = YES;
    _redLayer = redLayer;
    
    greenLayer.zPosition = 5;
    redLayer.zPosition = 10;
    

    
    
    [self.view.layer addSublayer:greenLayer];
    [self.view.layer addSublayer:redLayer];
    
    
    
    //sublayer
    CALayer *subLayer = [CALayer layer];
    [redLayer addSublayer:subLayer];
    subLayer.backgroundColor = [UIColor blueColor].CGColor;
    subLayer.frame = CGRectMake(10, 10, 30, 30);
    [redLayer addSublayer:subLayer];
    
    
    NSLog(@"frame: %@", NSStringFromCGRect(redLayer.frame));
    NSLog(@"bounds: %@", NSStringFromCGRect(redLayer.bounds));
    NSLog(@"position: %@", NSStringFromCGPoint(redLayer.position));
    NSLog(@"anchorPoint: %@", NSStringFromCGPoint(redLayer.anchorPoint));
    
    NSLog(@"Change anchorPoint");
    
    redLayer.anchorPoint = CGPointMake(0.0, 0.0);
    redLayer.position = CGPointMake(110 - 50, 180 - 50);
    
    NSLog(@"frame: %@", NSStringFromCGRect(redLayer.frame));
    NSLog(@"bounds: %@", NSStringFromCGRect(redLayer.bounds));
    NSLog(@"position: %@", NSStringFromCGPoint(redLayer.position));
    NSLog(@"anchorPoint: %@", NSStringFromCGPoint(redLayer.anchorPoint));
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //获取发生在view上的一个点
    CGPoint point = [[touches anyObject] locationInView:self.view];
    
    //通过hitTest方法找到点在哪个layer上面. 返回值是CALayer对象, UIView也有相关的方法
    CALayer *targetLayer = [self.view.layer hitTest:point];
    
    if (targetLayer == self.greenLayer) {
        NSLog(@"绿色 layer");
    }
    if (targetLayer == self.redLayer) {
        NSLog(@"红色 layer");
    }

}

@end
