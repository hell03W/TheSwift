//
//  DemoMacWaitController.swift
//  TestAnimationDemo
//
//  Created by  www.6dao.cc on 16/10/20.
//  Copyright © 2016年 Walden. All rights reserved.
//

import UIKit

class DemoMacWaitController: BaseController {
    
    
    private lazy var bgView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: 配置界面
    //思路: 贝塞尔曲线, 先画一个圆形, 复制一个, 旋转一定角度, 取对第一个取余, 得到的结果填充颜色
    //在原点, 先创建形状; 创建相切的形状, 取余填充后, 平移 + 旋转
    override func configUI() {
        
        // 一个承载主体的view
        view.addSubview(bgView)
        bgView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        bgView.center = view.center
        
        
        // 放置旋转各种颜色item的layer
        let colorArray = [UIColor.red,
                          UIColor.gray,
                          UIColor.yellow,
                          UIColor.blue,
                          UIColor.brown,
                          UIColor.cyan,
                          UIColor.red,
                          UIColor.gray,
                          UIColor.yellow,
                          UIColor.blue,
                          UIColor.brown,
                          UIColor.cyan]
        let items = 12
        let angle = M_PI * 2 / Double(items)
        var currentAngle: Double = 0
        let radius: CGFloat = 30.0
        
        for index in 0..<colorArray.count {
            
            // 1. 创建形状
            let position1 = CGRect(x: bgView.frame.width/2, y: bgView.frame.height/2, width: radius, height: radius)
            let bPath1 = UIBezierPath(roundedRect: position1, cornerRadius: radius / 2)
            
            // 2. 创建相切的形状
            let position2 = CGRect(x: bgView.frame.width/2 + 8, y: bgView.frame.height/2, width: radius, height: radius)
            let bPath2 = UIBezierPath(roundedRect: position2, cornerRadius: radius / 2)
            let targetPath = bPath1
            
            
            
            // 3. 填充颜色
            
            // 4. 平移 + 旋转
            
            
//            let layer = CALayer()
//            bgView.layer.addSublayer(layer)
//            layer.frame = CGRect(x: 0, y: 0, width: radius, height: radius)
//            layer.position = CGPoint(x: bgView.frame.width/2, y: bgView.frame.height/2)
//            layer.backgroundColor = colorArray[index].cgColor
//            layer.cornerRadius = layer.frame.width / 2
//            
//            let x = radius / 2 * cos(currentAngle)
//            let y = radius / 2 * sin(currentAngle)
//            layer.setAffineTransform(CGAffineTransform(translationX: CGFloat(x), y: CGFloat(y)))
//            
//            currentAngle += angle
        }
    }
    
    
    override func configAnimation() {
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.repeatCount = MAXFLOAT
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.duration = 0.8
//        bgView.layer.add(animation, forKey: nil)
    }

}
