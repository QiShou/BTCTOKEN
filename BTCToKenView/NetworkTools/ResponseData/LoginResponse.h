//
//  LoginResponse.h
//  BTCToKenView
//
//  Created by wangyi on 2018/1/26.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPBaseResponse.h"

@interface DataResponse :NSObject
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *property;

@end

@interface LoginResponse : HTTPBaseResponse
@property (nonatomic, strong) NSString *HIPPOWDTOKEN;//储存在本地 退出时候 给到请求头 让后台 改为：HIPPO_WDTOKEN
@property (nonatomic, strong) NSArray *data;
@end
