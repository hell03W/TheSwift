//
//  DemoBugtagsController.swift
//  TestAnimationDemo
//
//  Created by  www.6dao.cc on 16/10/17.
//  Copyright © 2016年 Walden. All rights reserved.
//

import UIKit

class DemoBugtagsController: BaseController {
    
    lazy private var redLayer = CALayer()
    lazy private var yellowLayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray

        
    }
    
    /// 配置动画元素
    override func configUI() {
        
        // 定义一个view, 放置两个圆形的带颜色的layer
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.addSubview(bgView)
        bgView.backgroundColor = UIColor.clear
        bgView.center = view.center
        
        //第一个layer, 后面的红色的layer
        bgView.layer.addSublayer(redLayer)
        redLayer.backgroundColor = UIColor.red.cgColor
        redLayer.frame = bgView.bounds
        redLayer.cornerRadius = bgView.bounds.width/2
        
        //第二个layer, 前面黄色的layer
        bgView.layer.addSublayer(yellowLayer)
        yellowLayer.backgroundColor = UIColor.yellow.cgColor
        yellowLayer.frame = bgView.bounds
        yellowLayer.cornerRadius = bgView.bounds.width/2
    }
    
    /// 配置动画
    override func configAnimation() {
        
        let duration: CFTimeInterval = 1
        
        // 红色layer, 从小开始放大
        let redAnimation = CABasicAnimation(keyPath: "transform.scale")
        redAnimation.fromValue = NSNumber(floatLiteral: 0)
        redAnimation.toValue = NSNumber(floatLiteral: 1)
        redAnimation.duration = duration
        redAnimation.repeatCount = MAXFLOAT
        redAnimation.autoreverses = true
        redAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        redLayer.add(redAnimation, forKey: nil)
        
        // 黄色layer, 从大开始变小
        let yellowAnimation = CABasicAnimation(keyPath: "transform.scale")
        yellowAnimation.fromValue = NSNumber(floatLiteral: 1)
        yellowAnimation.toValue = NSNumber(floatLiteral: 0)
        yellowAnimation.duration = duration
        yellowAnimation.repeatCount = MAXFLOAT
        yellowAnimation.autoreverses = true
        yellowAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        yellowLayer.add(yellowAnimation, forKey: nil)
        
        // 添加到组动画
        let group = CAAnimationGroup()
        group.animations = [redAnimation, yellowAnimation]
        group.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
    }
    

    

}

/*
 观察发现, bugtags上加载动画, 简单说, 就是两个view或者layer, 一个从大到小, 一个从小到大,
 
 实现过程:
 1. 定义两个layer, 并设置好大小和位置.
 2. 分别写两个动画放在两个layer上面, 两个动画合并成一个动画组.
 3. 动画组 无限循环执行, 可以倒回.
 4. 动画组开始时候有加速效果, 结束时候有减速效果.
 */
