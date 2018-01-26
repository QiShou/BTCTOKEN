//
//  UINavigationController+NavigationAnimation.h
//  JSH
//
//  Created by JHT-APP1 on 14-9-11.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (NavigationAnimation)

/* The name of the transition. Current legal transition types include
 * `fade', `moveIn', `push' and `reveal'. Defaults to `fade'. 
 */
- (void)pushViewController:(UIViewController *)viewController animatedType:(NSString *)type;

- (UIViewController *)popViewControllerAnimatedType:(NSString *)type;
@end
