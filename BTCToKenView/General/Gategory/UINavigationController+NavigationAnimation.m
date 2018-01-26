//
//  UINavigationController+NavigationAnimation.m
//  JSH
//
//  Created by JHT-APP1 on 14-9-11.
//  Copyright (c) 2014年 ___JHT___. All rights reserved.
//

#import "UINavigationController+NavigationAnimation.h"

@implementation UINavigationController (NavigationAnimation)

- (void)pushViewController:(UIViewController *)viewController animatedType:(NSString *)type
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type;
    transition.subtype = kCATransitionFromRight;
    transition.delegate = nil;
    [self.view.layer addAnimation:transition forKey:nil];
    
    [self pushViewController:viewController animated:YES];
}

- (UIViewController *)popViewControllerAnimatedType:(NSString *)type
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = type;
    transition.subtype = kCATransitionFromLeft;
    transition.delegate = nil;
    [self.view.layer addAnimation:transition forKey:nil];
    
    return [self popViewControllerAnimated:YES];
}

@end
