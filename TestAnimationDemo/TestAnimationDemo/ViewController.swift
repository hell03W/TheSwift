//
//  ViewController.swift
//  TestAnimationDemo
//
//  Created by  www.6dao.cc on 16/10/17.
//  Copyright © 2016年 Walden. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy private var tableView: UITableView = UITableView()
    lazy private var dataArray = {
        
        return ["1. 模仿bugtags.com加载动画",]
    }()
    lazy private var classArray = {
        
        return ["DemoBugtagsController",]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "测试动画 Demo"
        configUI()
    }

    
    func configUI() {
        
        // 配置tableView
        tableView.frame = view.bounds;
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView .register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller: BaseController
        if indexPath.row == 0 {
            controller = DemoBugtagsController()
        }else{
            controller = BaseController()
        }

        self.navigationController?.pushViewController(controller, animated: true)
        
    }


}

