//
//  NSDateFormatter+formatString.m
//  JFW
//
//  Created by OTgiraffe on 17/3/28.
//  Copyright © 2017年 jieshun. All rights reserved.
//

#import "NSDateFormatter+formatString.h"

@implementation NSDateFormatter (formatString)


+ (NSString *)currentTimeWithFormateStr:(NSString *)formateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = formateStr;
    return [formatter stringFromDate:[NSDate new]];
}

+ (NSString *)getCuurentTimeOfString {
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval a=[dat timeIntervalSince1970];
    
    NSString *timeString = [NSString stringWithFormat:@"%0.f", a];//转为字符型
    
    return timeString;
}


@end
