//
//  BaseViewController.h
//  JSPropertyManagement
//
//  Created by Emiya on 16/5/3.
//  Copyright © 2016年 jieshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"

typedef NS_ENUM(NSInteger, AfterSaleRequest) {
    AfterSaleRequestNewSendOrder = 0,
    AfterSaleRequestHaveToAppointment = 1,
    AfterSaleRequestEndOfService = 2,
    AfterSaleRequestHasBeenCompleted = 3,
    AfterSaleRequestUnfinished = 4,
};

@interface BaseViewController : UIViewController<UIAlertViewDelegate>

//显示加载圈
- (void)showProgress;

//显示有提示的加载圈
- (void)showProgress:(NSString *)message;

//隐藏加载圈
- (void)hideProgress;

//显示navigation上的加载圈
- (void)showProgressOnNavigation;

//显示navigation上的有提示的加载圈
- (void)showProgressOnNavigation:(NSString *)message;

//隐藏navigation上的加载圈
- (void)hideProgressOnNavigation;

//显示提示文字
- (void)showToast:(NSString *)message;

//显示只有确定按钮的对话框(无代理)
- (void)showAlert:(NSString *)message;

//显示只有确定按钮的对话框(有代理)
- (void)showAlertWithDelegate:(NSString *)message;

//显示有确定和取消按钮的对话框(有代理)
- (void)showDialogWithDelegate:(NSString *)message;

//设置UITextField有输入才能点击按钮
- (void)enableButtonOnTextField:(UIButton *)button textFieldArray:(NSArray *)textFieldArray;

//请求数据时显示遮挡页面
-(void)showShelterView;

//请求数据时隐藏遮挡页面
-(void)hideShelterView;

/*
 * 密码非法字符校验
 */
- (BOOL)passwordContainInvalidateChar:(NSString *)textString;

- (void)setRightBarButtonWithImage:(UIImage *)aImage size:(CGSize)size;

- (void)setLeftBarButtonWithImage:(UIImage *)aImage size:(CGSize)size;

- (UIView *)navigationTitleView:(NSString *)title;
- (void)setnavigationView:(UIView *)customView;
/**
 *  navigation左按钮点击事件
 *
 *  @param sender
 */
- (void)leftBarButtonTouchUpInside:(id)sender;
/**
 *  navigation右按钮点击事件
 *
 *  @param sender
 */
- (void)rightBarButtonTouchUpInside:(id)sender;
@end
