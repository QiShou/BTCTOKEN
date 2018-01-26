//
//  HomeCollectionViewCell.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/24.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "HomeTableViewCell.h"
#import "HomeViewController.h"
#import "BaseViewController.h"
@interface HomeCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL isFresh;
    int _pageIndex;
}
@end

@implementation HomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization
    [self setUPUI];
    
}

- (void)setUPUI {
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView NightWithType:UIViewColorTypeNormal];
    isFresh = YES;
    _pageIndex = 1;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];

}
- (void)setViewController:(BaseViewController *)viewController{
    _viewController = viewController;
}
#pragma mark - 刷新事件
-(void)headerRefresh{
    _pageIndex = 1;

    [self requestDataWithTitleString:nil];

}
-(void)footerRefresh{
    
    [self requestDataWithTitleString:nil];
}

-(void)endRefresh{
    if (self.tableView.mj_header.isRefreshing) {
        [self.tableView.mj_header endRefreshing];
    }
    if (self.tableView.mj_footer.isRefreshing ) {
        [self.tableView.mj_footer endRefreshing];
    }
}

- (void)requestDataWithTitleString:(NSString *)string {
    
    NSDictionary *param = @{
//                            @"userCode":[JFWUserServices sharedInstance].job_number,
//                            @"pageIndex":[NSNumber numberWithInteger:pageIndex],
                            @"pageSize":@10,
                            };
    [self.viewController showProgress];
    [[HTTPServices sharedInstance] postRequestWithURLSuffix:@"" parameters:param success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.viewController hideProgress];
        _pageIndex ++;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.viewController hideProgress];
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell" forIndexPath:indexPath];
    [cell NightWithType:UIViewColorTypeNormal];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.01;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0.01;
//}
@end
