//
//  TTFristTreeStructController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/7/30.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTFristTreeStructController.h"

@interface TTFristTreeStructController ()

@end

@implementation TTFristTreeStructController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图层的树状结构";
    
}

- (void)configUI {
    /*
     以下代码证明:
        UIView中的层级关系是通过CALayer图层来关联在一起的.
     */
    
    // 创建一个view, 并添加到self.view上面
    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:layerView];
    layerView.center = self.view.center;
    layerView.backgroundColor = [UIColor lightGrayColor];
    NSLog(@"%ld", layerView.layer.sublayers.count); /// result: 0
    
    
    // 创建一个子view. 并将之添加到 layerView上面
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    [layerView addSubview:subView];
    subView.backgroundColor = [UIColor redColor];
    NSLog(@"%ld", layerView.layer.sublayers.count); /// result: 1
    
    
    // 创建CALayer对象, 直接添加到layerView.layer图层上
    CALayer *blueLayer = [CALayer layer];
    [layerView.layer addSublayer:blueLayer];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.frame = CGRectMake(30, 30, 30, 30);
    NSLog(@"%ld", layerView.layer.sublayers.count); /// result: 2
    
    
//    blueLayer.transform
//    blueLayer.affineTransform = CGAffineTransformTranslate(<#CGAffineTransform t#>, <#CGFloat tx#>, <#CGFloat ty#>)

}

@end
