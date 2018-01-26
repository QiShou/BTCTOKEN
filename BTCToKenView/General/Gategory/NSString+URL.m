//
//  NSString+URL.m
//  JSH
//
//  Created by JHT-APP1 on 14-9-17.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import "NSString+URL.h"
#import <CoreFoundation/CoreFoundation.h>

@implementation NSString (URL)

- (NSString *)URLEncoding
{
    NSString* urlString = (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                               (__bridge CFStringRef)self,
                                                                                               nil,
                                                                                               CFSTR("~!@$&()+=':;?,/"),
                                                                                               kCFStringEncodingUTF8));
    
    return urlString;
}

- (NSString *)URLDecoding
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
