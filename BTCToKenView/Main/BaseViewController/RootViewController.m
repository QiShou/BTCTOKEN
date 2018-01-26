//
//  RootViewController.m
//  NightMode
//
//  Created by ZL on 2017/4/21.
//  Copyright © 2017年 ZL. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "GlobConditionsViewController.h"
#import "NewsMorViewController.h"
#import "MYInfoViewController.h"
#import "UIColor+Colours.h"
#import "ThemeManage.h"
#import "UIView+ThemeChange.h"

@interface RootViewController ()<UITabBarControllerDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.view NightWithType:UIViewColorTypeNormal];
    
    HomeViewController *homeCon = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    UINavigationController  *nav0 = [[UINavigationController  alloc] initWithRootViewController:homeCon];
    [nav0.navigationBar NightWithType:UIViewColorTypeNormal];

    homeCon.tabBarItem = [self setUpUIWithTitle:@"币行情" andTag:0 selectImageName:@"PaiGong_Select" nomolImageName:@"PaiGong_nomal" WithColorStr:@"#4aab44" titleColor:@""];
    

    GlobConditionsViewController *comCon = [[GlobConditionsViewController alloc] init];
    UINavigationController   *nav1 = [[UINavigationController   alloc] initWithRootViewController:comCon];
    [nav1.navigationBar NightWithType:UIViewColorTypeNormal];

    comCon.tabBarItem = [self setUpUIWithTitle:@"全球行情" andTag:1 selectImageName:@"Problem_select" nomolImageName:@"Problem_normal" WithColorStr:@"#4aab44" titleColor:@""];
//    nav1.title = @"全球行情";
    
    NewsMorViewController *setCon = [[NewsMorViewController alloc] init];
    UINavigationController   *nav2 = [[UINavigationController   alloc] initWithRootViewController:setCon];
    [nav2.navigationBar NightWithType:UIViewColorTypeNormal];

    setCon.tabBarItem = [self setUpUIWithTitle:@"早知道" andTag:2 selectImageName:@"My_select" nomolImageName:@"My_normal" WithColorStr:@"#4aab44" titleColor:@""];
//    nav2.title = @"早知道";
    
    MYInfoViewController *myCon = [[MYInfoViewController alloc] init];
    UINavigationController   *nav3 = [[UINavigationController   alloc] initWithRootViewController:myCon];
    [nav3.navigationBar NightWithType:UIViewColorTypeNormal];

    myCon.tabBarItem = [self setUpUIWithTitle:@"我的" andTag:2 selectImageName:@"My_select" nomolImageName:@"My_normal" WithColorStr:@"#4aab44" titleColor:@""];
//    nav3.title = @"我的";
    
    if (OSVersionIsAtLeastiOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    NSArray *arr = [[NSArray alloc] initWithObjects:nav0,nav1,nav2,nav3,nil];
    
    self.viewControllers = arr;
    self.selectedIndex = 0;
    self.delegate = self;
    self.tabBar.translucent = NO;
    [[UINavigationBar appearance] setTranslucent:NO];

}

- (UITabBarItem *)setUpUIWithTitle:(NSString *)title andTag:(NSInteger)tag selectImageName:(NSString *)selectImagename nomolImageName:(NSString *)normlName WithColorStr:(NSString *)colorStr titleColor:(NSString *)titleColor{
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:nil tag:tag];
    
    item.selectedImage = [[UIImage imageNamed:selectImagename] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.image = [[UIImage imageNamed:normlName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor colorFromHexString:colorStr], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateSelected];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor colorFromHexString:titleColor], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, nil]] forState:UIControlStateNormal];
    return item;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
