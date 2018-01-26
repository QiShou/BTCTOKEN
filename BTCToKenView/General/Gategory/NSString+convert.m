//
//  NSString+convert.m
//  JSH
//
//  Created by JHT-APP1 on 14-10-14.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import "NSString+convert.h"

@implementation NSString (convert)

+ (NSString *)convertDateString:(NSString *)dateString addMin:(NSString *)minString
{
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [dateFormatter dateFromString:dateString];
    NSTimeInterval interval = [date timeIntervalSince1970];
    double attach = [minString doubleValue];
    interval += attach * 60;
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)convertHtmlString:(NSString *)htmlString
{
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    htmlString = [htmlString stringByReplacingOccurrencesOfString:@"&apos;" withString:@" "];
    return htmlString;
}

+ (NSString *)convertHtmlStringByRequest:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@">" withString:@"&gt;"];
    string = [string stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
    string = [string stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    return string;
}

@end
