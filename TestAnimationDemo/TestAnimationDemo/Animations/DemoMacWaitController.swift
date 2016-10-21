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
        
        
        configMoon()
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
    
    
    
    /// 测试, 画一个月牙形状
    /*
     思路:
     "画"两个圆形, 相交, 建立坐标轴, 依次取出对应的点, 组成一个月牙形状
     */
    func configMoon() {
        
        let radius: CGFloat = 50
        let arcCenter1 = CGPoint(x: 100, y: 200);
        let arcCenter2 = CGPoint(x: 120, y: 200);
        
        
        let round1 = UIBezierPath(arcCenter: arcCenter1, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let round2 = UIBezierPath(arcCenter: arcCenter2, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        round1.append(round2)
        
        let shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.path = round1.cgPath
        
        
        
        
        
        //
        let resultPath = UIBezierPath()
        // 1. 先移动到顶点位置
        
        
        
        let resultShape = CAShapeLayer()
        view.layer.addSublayer(resultShape)
        resultShape.strokeColor = UIColor.blue.cgColor
        resultShape.fillColor = UIColor.clear.cgColor
        resultShape.lineWidth = 1
    }
    
    
    //根据  圆的y坐标/圆心/半径, 返回x坐标
    // 默认是以圆心为原点的方程, 计算结束后, 加上圆心位置
    func calcPositionX(arcCenter: CGPoint, radius: CGFloat, y: CGFloat) -> CGFloat {
        
        let yPosition = y - arcCenter.y
        
        var x = sqrt(pow(radius, 2) - pow(yPosition, 2))
        
        if yPosition < 0 {
            x = -x
        }
        
        return x + arcCenter.x
    }

}












