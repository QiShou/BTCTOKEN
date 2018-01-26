//
//  NSDictionary+JsonString.h
//  JSH
//
//  Created by JHT-APP1 on 15/8/7.
//  Copyright (c) 2015年 ___JHT___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JsonString)

// 转换json字符串为字典对象
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
