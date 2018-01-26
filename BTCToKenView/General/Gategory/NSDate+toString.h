//
//  NSDate+toString.h
//  JSH
//
//  Created by JHT-APP1 on 14-9-25.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (toString)

//获取时间格式为2014-01-01 12：11；11字符串
- (NSString *)stringWithyMdHms;


//获取一个月前的时间字符串
- (NSString *)stringWithMonthAge:(NSTimeInterval)time;

@end
