//
//  NSString+Size.m
//  03-根据文字计算宽度或者高度
//
//  Created by vera on 16/1/11.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

/**
 *  根据文字计算宽度和高度
 *
 *  @param attributes 文字属性
 *  @param size       文字大最大范围
 *
 *  @return 计算文字的大小
 */
- (CGSize)sizeWithAttributes:(NSDictionary *)attributes maxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

@end
