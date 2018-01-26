//
//  NSString+convert.h
//  JSH
//
//  Created by JHT-APP1 on 14-10-14.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (convert)

+ (NSString *)convertDateString:(NSString *)dateString addMin:(NSString *)minString;

+ (NSString *)convertHtmlString:(NSString *)htmlString;

+ (NSString *)convertHtmlStringByRequest:(NSString *)string;

@end
