//
//  TTLayerImageController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/7/30.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "TTLayerImageController.h"

@interface TTLayerImageController ()

@end

@implementation TTLayerImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"寄宿图";
}

- (void)configUI {
    
    UIImage *image = [UIImage imageNamed:@"image1.png"];
    
    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    [self.view addSubview:layerView];
    
    CALayer *imgLayer = layerView.layer;
//    imgLayer.frame = CGRectMake(0, 0, 300, 300);
    imgLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    imgLayer.borderColor = [UIColor redColor].CGColor;
    imgLayer.borderWidth = 1;
    
    //1. contents属性
    // add image directly to our view's layer
    // 这里通过(__bridge id)将CGImageRef类型转换成id类型, 结果图片可以展示出来了, 但是, 图片被压缩了.
    imgLayer.contents = (__bridge id)image.CGImage;
    
    //2. contentGravity属性
    // 通过设置contents, 图片已经被显示出来了, 但是如果图片尺寸和layer尺寸比例并不完全相同, 图片将会被压缩或者拉伸, 类似于使用UIImageView时候的contentMode, layer有类似的属性: contentGravity.
    imgLayer.contentsGravity = kCAGravityResizeAspect;
    
    //3. contentsScale属性
    // 简单说, 就是设置图片在每个pt绘制的px的密度, 在retain屏幕上需要用到, 默认是1,
    imgLayer.contentsScale = [UIScreen mainScreen].scale;
    
    //4. msaksToBounds属性
    // 这个其实用的还是比较多的, 不解释, 对应于UIView的clipsToBounds
//    imgLayer.masksToBounds = YES;
    
    //5. contentsRect
    // contentsRect允许我们在图层边框中显示寄宿图的一个子域,就是说, 显示寄宿图中的一部分, 参数是CGRect类型的,值域(0-1), 表示一个范围.
//    imgLayer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
    
    //6. contentsCenter属性
    // 就是用来拉伸或者压缩图片比例的???  这个没太看懂, 实际项目中...
    imgLayer.contentsCenter = CGRectMake(0.25, 0, 0.5, 1);
    
    
    //7. 可以通过实现CALayer的代理方法, 然后在代理方法中使用CGContent自己绘制图形. 和UIView中的 -drawRect: 方法类似.
    
    
    
    NSLog(@"%i", imgLayer.masksToBounds);
    
    layerView.clipsToBounds = YES;
    
    NSLog(@"%i", imgLayer.masksToBounds);
    
    
}

@end
