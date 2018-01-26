//
//  NSString+compareWithAscill.m
//  JSH
//
//  Created by JHT-APP1 on 14-9-15.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import "NSString+compareWithAscill.h"
#import <string.h>

@implementation NSString (compareWithAscill)

- (NSInteger)compareWithAscill:(NSString *)string
{
    const char * p = [self cStringUsingEncoding:NSUTF8StringEncoding];
    const char * q = [string cStringUsingEncoding:NSUTF8StringEncoding];
   
    unsigned long char_index = 0, lenA = strlen(p), lenB = strlen(q);
    unsigned long len = lenA < lenB ? lenA : lenB;
    while (char_index < len) {
        char cA = p[char_index], cB = q[char_index];
        char cA_ = (char) (cA >= 'a' ? cA - ('a' - 'A') : cA);
        char cB_ = (char) (cB >= 'a' ? cB - ('a' - 'A') : cB);
        if (cA_ == cB_) {
            if (cA != cB)
                return cA - cB;
        } else
            return cA_ - cB_;
        char_index++;
    }
    if (lenA == lenB)
        return 0;
    else if (lenA > lenB)
        return p[len];
    else
        return -q[len];
}

@end
