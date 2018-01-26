//
//  UIDevice+Version.m
//  04-请求block封装
//
//  Created by vera on 16/1/22.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "UIDevice+Version.h"

@implementation UIDevice (Version)

/**
 *  返回当前系统版本
 *
 *  @return <#return value description#>
 */
+ (CGFloat)currentSystemVersion
{
    return [UIDevice currentDevice].systemVersion.floatValue;
}

@end
