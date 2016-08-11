//
//  TTChangeColor.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/11.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTChangeColor.h"

@interface TTChangeColor ()

@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation TTChangeColor

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}


- (CALayer *)colorLayer {
    
    if (!_colorLayer) {
        _colorLayer = [CALayer layer];
        _colorLayer.backgroundColor = [UIColor blueColor].CGColor;
        _colorLayer.frame = CGRectMake(20, 20, 100, 80);
    }
    return _colorLayer;
    
}
- (void)configUI {
    
    [self.layer addSublayer:self.colorLayer];
    
    //btn
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:changeButton];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [changeButton setTitle:@"change color" forState:0];
    [changeButton setTitleColor:[UIColor blackColor] forState:0];
    changeButton.frame = CGRectMake(20, 120, 100, 23);
    [changeButton addTarget:self action:@selector(changeButtonClick1:) forControlEvents:64];
    changeButton.layer.cornerRadius = 4;
    changeButton.layer.borderColor = [UIColor grayColor].CGColor;
    changeButton.layer.borderWidth = 1;
}

#pragma mark - 测试过渡动画
- (void)changeButtonClick1:(UIButton *)sender {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions =  @{@"backgroundColor": transition};
    
    
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    sender.layer.backgroundColor = self.colorLayer.backgroundColor;
}


#pragma mark - 测试事务控制CALayer动画
- (void)changeButtonClick:(UIButton *)sender {
    
    // 开始一个新的事物
    [CATransaction begin];
    // 设置事务的 动画执行时间
    [CATransaction setAnimationDuration:1.f];
    // 禁用动画
    [CATransaction setDisableActions:NO];
    // 设置事务执行完成后的代码块
    [CATransaction setCompletionBlock:^{
        NSLog(@"Animation over");
        self.colorLayer.affineTransform = CGAffineTransformRotate(self.colorLayer.affineTransform, M_PI_4);
    }];
    
    //randomize the layer background color
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    sender.layer.backgroundColor = self.colorLayer.backgroundColor;
    
    // 提交事务和动画
    [CATransaction commit];
}

@end
