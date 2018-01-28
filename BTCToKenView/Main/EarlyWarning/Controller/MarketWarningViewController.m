//
//  MarketWarningViewController.m
//  BTCToKenView
//
//  Created by wangwenhao on 2018/1/28.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "MarketWarningViewController.h"
#import "MarketWarningCell.h"

@interface MarketWarningViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MarketWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MarketWarningCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MarketWarningCell class])];
}

#pragma mark - UITableView 数据源
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
//cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MarketWarningCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MarketWarningCell class])];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
