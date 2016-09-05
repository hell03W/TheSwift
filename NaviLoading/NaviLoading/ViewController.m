//
//  ViewController.m
//  NaviLoading
//
//  Created by  www.6dao.cc on 16/8/23.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我是标题";
    
    NSLog(@"%@", [self.navigationItem.titleView class]);
    
    
    
    // 配置titleView
    
    UILabel *titleView = [[UILabel alloc] init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
