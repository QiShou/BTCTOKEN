//
//  NSURL+imageURL.m
//  CiticMovie
//
//  Created by fuqiang on 3/19/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import "NSURL+imageURL.h"

@implementation NSURL (imageURL)

+ (id)URLWithString:(NSString *)URLString imageRect:(CGRect )rect;
{
    NSString *newURLString = URLString;
    
    if ([URLString hasSuffix:@"&w="])
    {
        newURLString = [NSString stringWithFormat:@"%@%f",newURLString,rect.size.width * 2];
    }
    
    return [[self class] URLWithString:newURLString];
}

@end
