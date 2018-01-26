//
//  NSString+mask.h
//  JSH
//
//  Created by JHT-APP1 on 14-9-16.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (mask)

+ (NSString *)mask:(NSString *)string;

+ (BOOL)checkLogicOfString:(NSString *)string;

//验证手机号码
+ (BOOL)validateMobile:(NSString *)mobileNum;

@end
