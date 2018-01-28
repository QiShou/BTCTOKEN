//
//  MYInfoViewController.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/22.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "MYInfoViewController.h"
#import "MyFirstSecTableViewCell.h"
#import "LoginTableViewCell.h"
#import "MySecTableViewCell.h"
#import "LoginViewController.h"
#import "LogOutViewController.h"
@interface MYInfoViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *_secArr;
    NSArray *_thdArr;
    NSArray *_fouthArr;
    NSArray *_secArrB;
  
}
@property (weak, nonatomic) IBOutlet UITableView *tbaleView;

@end

@implementation MYInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"我的"];

    // Do any additional setup after loading the view from its nib.
//    [self.tbaleView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.tbaleView registerNib:[UINib nibWithNibName:@"LoginTableViewCell" bundle:nil] forCellReuseIdentifier:@"LoginTableViewCell"];
    [self.tbaleView registerNib:[UINib nibWithNibName:@"MyFirstSecTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyFirstSecTableViewCell"];
    [self.tbaleView registerNib:[UINib nibWithNibName:@"MySecTableViewCell" bundle:nil] forCellReuseIdentifier:@"MySecTableViewCell"];
    
    self.tbaleView.delegate = self;
    self.tbaleView.dataSource = self;
//    self.tbaleView.separatorColor = [UIColor colorWithRed:135/255 green:135/255 blue:135/255 alpha:0.7];
    
    
    [self.tbaleView NightWithType:UIViewColorTypeNormal];
    [self setUpUI];
}

- (void)setUpUI{
    _secArr = @[@"币资产",@"币行情自选",@"币价显示"];
    _secArrB =@[@"值多少钱",@"添加，取消，排序",@"人命币"];
    _thdArr = @[@"红涨绿跌",@"夜间模式",@"行情列表K线图标隐藏"];
    _fouthArr = @[@"家微信群",@"推荐",@"关于"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchAction:(UISwitch *)sender {
    
    switch (sender.tag) {
        case 1000: {
                
            }
            break;
        case 1001: {
            [ThemeManage shareThemeManage].isNight = ![ThemeManage shareThemeManage].isNight;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeColor" object:nil];
            [[NSUserDefaults standardUserDefaults] setBool:[ThemeManage shareThemeManage].isNight forKey:@"night"];
            if (sender.isOn) {
                [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"lightType"];

            } else {
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"lightType"];

            }
        }
            break;
        case 1002: {
            
        }
            break;
            
        default:
            break;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    } else {
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:{
            
          
            LoginTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LoginTableViewCell" forIndexPath:indexPath];
            cell.loginLabel.text = @"登录";
            [cell.loginLabel NightWithType:UIViewColorTypeNormal];
            [cell.loginLabel NightTextType:LabelColorGray];
            [cell NightWithType:UIViewColorTypeNormal];
            return cell;
            }
            break;
        case 1:{
            MyFirstSecTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyFirstSecTableViewCell" forIndexPath:indexPath];
            cell.biaotiLabel.text = _secArr[indexPath.row];
            [cell.biaotiLabel NightWithType:UIViewColorTypeNormal];
            [cell.biaotiLabel NightTextType:LabelColorGray];
            [cell.infoBtn setTitle:_secArrB[indexPath.row] forState:UIControlStateNormal];
            [cell NightWithType:UIViewColorTypeNormal];
            return cell;
        }
            break;
        case 2:{
            MySecTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MySecTableViewCell" forIndexPath:indexPath];
            cell.biaotiLabel.text = _thdArr[indexPath.row];
            cell.secCwitch.tag = 1000 + indexPath.row;
            [cell.secCwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
            [cell.biaotiLabel NightWithType:UIViewColorTypeNormal];
            [cell.biaotiLabel NightTextType:LabelColorGray];
            [cell NightWithType:UIViewColorTypeNormal];

            return cell;
        }
            break;
        case 3:{
            MyFirstSecTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyFirstSecTableViewCell" forIndexPath:indexPath];
            [cell NightWithType:UIViewColorTypeNormal];
            cell.biaotiLabel.text = _fouthArr[indexPath.row];
            [cell.biaotiLabel NightWithType:UIViewColorTypeNormal];
            [cell.biaotiLabel NightTextType:LabelColorGray];
            if (indexPath.row == 2) {
                [cell.infoBtn setTitle:@"V1.0.0" forState:UIControlStateNormal];
            }
            return cell;
        }
            break;
        default:
            break;
    }
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.section) {
        case 0:{
            
            LogOutViewController *con = [[LogOutViewController alloc] init];
            con.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:con animated:YES];
            
//            NSString *hippowdtoken = [[NSUserDefaults standardUserDefaults] objectForKey:@"HIPPOWDTOKEN"];
//            if (hippowdtoken && ![hippowdtoken isEqualToString:@""]) {
//                LogOutViewController *con = [[LogOutViewController alloc] init];
//                con.hidesBottomBarWhenPushed = YES;
//                [self.navigationController pushViewController:con animated:YES];
//            } else {
//
//                LoginViewController *con = [[LoginViewController alloc] init];
//                con.hidesBottomBarWhenPushed = YES;
//                [self.navigationController pushViewController:con animated:YES];
//            }
        }
            break;
        case 1:{
        
        }
            break;
        case 2:{
            return ;
        }
            break;
        case 3:{
    
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 90;
    } else {
        
        return 55;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.005;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}
- (void)dealloc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
