//
//  ViewController.m
//  TestCoreAnimation
//
//  Created by  www.6dao.cc on 16/7/30.
//  Copyright © 2016年 Walden. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *classArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试核心动画";
    
    [self configUI];
}

- (void)configUI {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (NSArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = @[@"第一章 图层的树状结构",
                       @"第二章 寄宿图",
                       @"第三章 视觉效果",
                       @"第四章 图形几何学",
                       @"第五章 变换"];
    }
    return _dataArray;
}
- (NSArray *)classArray {
    
    if (!_classArray) {
        _classArray = @[@"TTFristTreeStructController",
                        @"TTLayerImageController",
                        @"TTVisualEffectController",
                        @"TTAboutShapeController",
                        @"TTTransformController"];
    }
    return _classArray;
}
#pragma mark - UITableViewDelegate, UITableViewDataSourse 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *controller = [[NSClassFromString(self.classArray[indexPath.row]) alloc] init];
    
    [self.navigationController pushViewController:controller animated:YES];
}



@end
