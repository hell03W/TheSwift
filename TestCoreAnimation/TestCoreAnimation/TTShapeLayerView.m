//
//  TTShapeLayerView.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/17.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTShapeLayerView.h"

@implementation TTShapeLayerView

+ (Class)layerClass {
    return [CAShapeLayer class];
}


- (CAShapeLayer *)shapeLayer {
    
    return (CAShapeLayer *)self.layer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
