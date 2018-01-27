//
//  LoginResponse.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/26.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "LoginResponse.h"


@implementation DataResponse
@end

@implementation LoginResponse
+ (NSDictionary *)objectClassInArray{
    return @{
             
             @"data" : @"DataResponse"
             };
}

//+(NSDictionary)objectClassInArray {
//    return @{
//             
//             @"data" : [DataResponse class]
//             };
//}


@end
