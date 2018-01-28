//
//  BTCSearchViewController.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/27.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "BTCSearchViewController.h"

@interface BTCSearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *serachBar;

@end

@implementation BTCSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpUI];
}

- (void)setUpUI {
//    BOOL ison = [[NSUserDefaults standardUserDefaults] objectForKey:@"lightType"];
//    if (ison) {
//        self.serachBar.barStyle = UIBarStyleDefault;
//    } else {
//        self.serachBar.barStyle = UIBarStyleBlack;
//    }
    self.serachBar.delegate = self;
    [self.serachBar NightWithType:UIViewColorTypeNormal];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar showsCancelButton];
//    [searchBar setShowsCancelButton:NO];
    for (id view  in searchBar.subviews) {
        
    }

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text =@"测试";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    BTCSearchViewController *con = [[BTCSearchViewController alloc] init];
    [self.navigationController pushViewController:con animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
