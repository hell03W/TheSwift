//
//  TTReplicatorView.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/8/18.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTReplicatorView.h"

@implementation TTReplicatorView

+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

- (CAReplicatorLayer *)replicatorLayer {
    
    return (CAReplicatorLayer *)self.layer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
