//
//  NSString+BytesLength.m
//  CiticMovie
//
//  Created by fuqiang on 3/5/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import "NSString+BytesLength.h"

@implementation NSString (BytesLength)

- (NSUInteger)lengthOfBytes
{
    return [self lengthOfBytesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
}

@end
