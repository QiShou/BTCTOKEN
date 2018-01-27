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
    
        switch (sender.tag) {
            case 1001:{
                
                [self userLoginRequest:self.emailTextfield.text andpassword:self.secTextField.text];
            }

                break;
            case 1002:{
                
                [self userRegisterRequest:self.emailTextfield.text andpassword:self.secTextField.text];
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
            
            [[NSUserDefaults standardUserDefaults] setValue:result.HIPPO_WDTOKEN forKey:@"HIPPO_WDTOKEN"];
            
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




- (void)userLogoutRequest:(NSString *)email andpassword:(NSString *)password {
    
//    NSDictionary *prarm = @{
//                            @"email":email,
//                            @"password":password,
//                            @"deviceid":[[[UIDevice currentDevice] identifierForVendor] UUIDString]
//                            };
  NSString *Hippo_wdtoken =  [[NSUserDefaults standardUserDefaults] objectForKey:@"HIPPO_WDTOKEN"];
    [self.viewController showProgress];
    [[HTTPServices sharedInstance] postRequestWithURLSuffix:AC_Logout parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        [self.viewController hideProgress];
        HTTPBaseResponse *result = [HTTPBaseResponse mj_objectWithKeyValues:responseObject];
        if ([result.responseCode isEqualToString:@"10001"]) {
            
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
