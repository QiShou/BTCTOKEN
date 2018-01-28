//
//  LoginCollectionViewCell.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/26.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "LoginCollectionViewCell.h"
#import "LoginViewController.h"
#import "LoginResponse.h"
#import "RegistResponse.h"

@implementation LoginCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)clickBtn:(UIButton *)sender {
    NSString *string = sender.titleLabel.text;
    
        switch (sender.tag) {
            case 1001:{
                
                [self userLoginRequest:self.emailTextfield.text andpassword:self.secTextField.text];
            }
                break;
            case 1002:{
                if ([string isEqualToString:@"注册"]) {
                    [self userRegisterRequest:self.emailTextfield.text andpassword:self.secTextField.text];
                } else {
                    [self userLoginRequest:self.emailTextfield.text andpassword:self.secTextField.text];
                    
                }
            }
                break;
            case 1003:{
                //重新申请账号
//                [self userRegisterRequest:self.emailTextfield.text andpassword:self.secTextField.text];
            }
                
                break;
            default:
                break;
        }
}
- (void)setViewController:(BaseViewController *)viewController {
    _viewController = viewController;
}

#pragma mark - 注册
- (void)userRegisterRequest:(NSString *)email andpassword:(NSString *)password {
    NSDictionary *prarm = @{
                            @"email":email,
                            @"password":password
                            };
    [self.viewController showProgress];
    [[HTTPServices sharedInstance] postRequestWithURLSuffix:AC_Register parameters:prarm success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self.viewController hideProgress];
        LoginResponse *result = [LoginResponse mj_objectWithKeyValues:responseObject];
        if ([result.responseCode isEqualToString:@"10001"]) {
            [self.viewController popoverPresentationController];
        } else if ([result.responseCode isEqualToString:@"20001"]){
            [self.viewController showToast:@"用户已经存在，请直接登录！"];
        }else if ([result.responseCode isEqualToString:@"10002"]){
            [self.viewController showToast:@"输入有误，请重新输入！"];
        }else {
//            for (DataResponse *resopnse in result.data) {
//                if (resopnse.) {
//                    <#statements#>
//                }
//            }
            [self.viewController showToast:@"注册失败"];
//            [self.viewController showToast:result.responseMsg];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.viewController hideProgress];
        [self.viewController showToast:@"网络请求失败"];
    }];
}

- (void)userLoginRequest:(NSString *)email andpassword:(NSString *)password {
    
    NSDictionary *prarm = @{
                            @"email":email,
                            @"password":password,
                            @"deviceid":[[[UIDevice currentDevice] identifierForVendor] UUIDString]
                            };
    [self.viewController showProgress];
    [[HTTPServices sharedInstance] postRequestWithURLSuffix:AC_Login parameters:prarm success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [self.viewController hideProgress];
        LoginResponse *result = [LoginResponse mj_objectWithKeyValues:responseObject];
        if ([result.responseCode isEqualToString:@"10001"]) {
            [self.viewController showToast:@"请求成功"];
            
            [[NSUserDefaults standardUserDefaults] setValue:result.HIPPOWDTOKEN forKey:@"HIPPOWDTOKEN"];

        } else {
            //            for (DataResponse *resopnse in result.data) {
            //                if (resopnse.) {
            //                    <#statements#>
            //                }
            //            }
            [self.viewController showToast:result.responseMsg];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.viewController hideProgress];

        [self.viewController showToast:@"网络请求失败"];

    }];

}


@end
