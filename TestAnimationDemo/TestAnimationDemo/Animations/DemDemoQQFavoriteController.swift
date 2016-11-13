//
//  DemDemoQQFavoriteController.swift
//  TestAnimationDemo
//
//  Created by  www.6dao.cc on 16/10/21.
//  Copyright © 2016年 Walden. All rights reserved.
//

import UIKit

class DemDemoQQFavoriteController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func configUI() {
        
        let favoView = UIView(frame: CGRect(x: 100, y: 300, width: 20, height: 20))
        view.addSubview(favoView)
        favoView.backgroundColor = UIColor.red
        
    }

}
