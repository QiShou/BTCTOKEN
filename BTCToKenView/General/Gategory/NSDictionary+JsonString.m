//
//  NSDictionary+JsonString.m
//  JSH
//
//  Created by JHT-APP1 on 15/8/7.
//  Copyright (c) 2015年 ___JHT___. All rights reserved.
//

#import "NSDictionary+JsonString.h"

@implementation NSDictionary (JsonString)

// 转换json字符串为字典对象
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        jsonObj = nil;
    }
    return jsonObj;
}

@end
