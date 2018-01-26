//
//  NSDate+toString.m
//  JSH
//
//  Created by JHT-APP1 on 14-9-25.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import "NSDate+toString.h"

@implementation NSDate (toString)

- (NSString *)stringWithyMdHms
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithMonthAge:(NSTimeInterval)time
{
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    timeInterval -= time;
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return [date stringWithyMdHms];
}

@end
