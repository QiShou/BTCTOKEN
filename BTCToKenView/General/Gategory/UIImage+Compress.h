//
//  ksd.h
//  JSH
//
//  Created by JHT-APP1 on 14/12/10.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Compress)

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
