//
//  LogOutViewController.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/27.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "LogOutViewController.h"
#import "HTTPBaseResponse.h"
@interface LogOutViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginOutBtn;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *emaillabelNum;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

@implementation LogOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//
    [self.loginView NightWithType:UIViewColorTypeNormal];
    [self.emailLabel NightWithType:UIViewColorTypeNormal];
    [self.emaillabelNum NightWithType:UIViewColorTypeNormal];
    [self.tipLabel NightWithType:UIViewColorTypeNormal];
//
//    [self.loginOutBtn NightWithType:UIViewColorTypeNormal];
    
    [self.view NightWithType:UIViewColorTypeNormal];
}
- (IBAction)clickBtn:(UIButton *)sender {
    [self userLogoutRequest];
}

- (void)userLogoutRequest {
    
    NSString *Hippowdtoken =  [[NSUserDefaults standardUserDefaults] objectForKey:@"HIPPOWDTOKEN"];
    [self showProgress];
    [[HTTPServices sharedInstance] postRequestWithURLSuffix:AC_Logout parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [self hideProgress];
        HTTPBaseResponse *result = [HTTPBaseResponse mj_objectWithKeyValues:responseObject];
        if ([result.responseCode isEqualToString:@"10001"]){
            [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"HIPPOWDTOKEN"];
            [self popoverPresentationController];
        } else {
            // for (DataResponse *resopnse in result.data) {
            //                if (resopnse.) {
            //                    <#statements#>
            //                }
            //            }
            [self showToast:result.responseMsg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hideProgress];
        
        [self showToast:@"网络请求失败"];
        
    }];
    
}

@end
