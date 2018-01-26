//
//  BaseViewController.m
//  JSPropertyManagement
//
//  Created by Emiya on 16/5/3.
//  Copyright © 2016年 jieshun. All rights reserved.
//

#import "BaseViewController.h"
#import "UIColor+Colours.h"
#import "MBProgressHUD.h"
#import "UIView+Toast.h"
#import "AppMacro.h"
@interface BaseViewController ()
@end

@implementation BaseViewController
{
    MBProgressHUD *progress;
    MBProgressHUD *progressNavigetion;
    UIAlertView *alertView;
    UIAlertView *dialogView;
    UIButton *enablebutton;
    NSArray *enableTextFieldArray;
    UIView * shelterView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
//    self.navigationController.navigationBar.barTintColor = kMainGreenColor;
//    self.navigationController.navigationBar.translucent = NO;
//    [self initMapSearch];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1]];
//    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.shadowImage = nil;
    
//    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}


- (void)showProgress {
    if(progress == nil) {
        progress = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:progress];
    }
    [progress show:YES];
}

- (void)showProgress:(NSString *)message {
    if(progress == nil) {
        progress = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:progress];
    }
    progress.labelText = message;
    [progress show:YES];
}

- (void)hideProgress {
    [progress hide:YES];
}

- (void)showProgressOnNavigation {
    if(progressNavigetion == nil && self.navigationController != nil) {
        progressNavigetion = [[MBProgressHUD alloc] initWithView:self.view];
        [self.navigationController.view addSubview:progressNavigetion];
    }
    [progressNavigetion show:YES];
    if(self.navigationController != nil) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)showProgressOnNavigation:(NSString *)message {
    if(progressNavigetion == nil && self.navigationController != nil) {
        progressNavigetion = [[MBProgressHUD alloc] initWithView:self.view];
        [self.navigationController.view addSubview:progressNavigetion];
    }
    progressNavigetion.labelText = message;
    [progressNavigetion show:YES];
    if(self.navigationController != nil) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)hideProgressOnNavigation {
    [progressNavigetion hide:YES];
    if(self.navigationController != nil) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)showToast:(NSString *)message {
    [self.view makeToast:message duration:1 position:CSToastPositionCenter];
}

- (void)showAlert:(NSString *)message {
    if(alertView == nil) {
        alertView = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    } else {
        alertView.title = message;
        alertView.delegate = nil;
    }
    [alertView show];
}

- (void)showAlertWithDelegate:(NSString *)message {
    if(alertView == nil) {
        alertView = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    } else {
        alertView.title = message;
        alertView.delegate = self;
    }
    [alertView show];
}

- (void)showDialogWithDelegate:(NSString *)message {
    if(alertView == nil) {
        alertView = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    } else {
        alertView.title = message;
        alertView.delegate = self;
    }
    [alertView show];
}

- (void)enableButtonOnTextField:(UIButton *)button textFieldArray:(NSArray *)textFieldArray {
    enablebutton = button;
    enableTextFieldArray = textFieldArray;
    enablebutton.highlighted = YES;
    enablebutton.enabled = NO;
    enablebutton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    
    for(UITextField *textField in enableTextFieldArray) {
        [textField addTarget:self action:@selector(editTextField) forControlEvents:UIControlEventAllEditingEvents];
    }
}

-(void)editTextField {
    for(UITextField *textField in enableTextFieldArray) {
        if([textField.text isEqualToString:@""]) {
            enablebutton.highlighted = YES;
            enablebutton.enabled = NO;
            enablebutton.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
            break;
        }
        enablebutton.highlighted = NO;
        enablebutton.enabled = YES;
        enablebutton.backgroundColor = [UIColor colorFromHexString:@"#6dd04b"];
    }
}

-(void)showShelterView{

    if(shelterView == nil) {
        shelterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        shelterView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:shelterView];
    }
    [self.view insertSubview:shelterView belowSubview:progress];
    shelterView.hidden = NO;
}

-(void)hideShelterView{

    shelterView.hidden = YES;
}

#pragma mark - Login
- (BOOL)passwordContainInvalidateChar:(NSString *)textString
{
    NSString * regex = @"[.+@~,:*?!_#/=&^;%$(-\\\\)..\\[\\]\"<>|{}'a-zA-Z0-9]{1,}";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    BOOL isMatch = [pred evaluateWithObject:textString];
    
    if (isMatch) {
        
        return YES;
    }else{
    
        return NO;
    }
}

#pragma mark UINavigationControllerDelegate
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    if ([self.childViewControllers count] == 1) {
//        return NO;
//    }
//    return YES;
//}
//
//// 我们差不多能猜到是因为手势冲突导致的，那我们就先让 ViewController 同时接受多个手势吧。
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}
////运行试一试，两个问题同时解决，不过又发现了新问题，手指在滑动的时候，被 pop 的 ViewController 中的 UIScrollView 会跟着一起滚动，这个效果看起来就很怪（知乎日报现在就是这样的效果），而且也不是原始的滑动返回应有的效果，那么就让我们继续用代码来解决吧
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
//}

/*
#pragma mark - Navigation

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

#pragma mark - NavigationBar按钮
- (void)setRightBarButtonWithImage:(UIImage *)aImage size:(CGSize)size
{
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:aImage forState:UIControlStateNormal];
    rightButton.frame = (CGRect)
    {
        .origin.x = 0,
        .origin.y = 0,
        .size     = size,
    };
    [rightButton addTarget:self action:@selector(rightBarButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setLeftBarButtonWithImage:(UIImage *)aImage size:(CGSize)size
{
    CGFloat barButtonLeftSpace = 16.0;  //系统设置的返回按钮预留的左space
    CGSize imageSize = aImage ? aImage.size : CGSizeMake(0, 0);
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:aImage forState:UIControlStateNormal];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(
                                                    (size.height - imageSize.height) / 2
                                                    ,barButtonLeftSpace
                                                    ,(size.height - imageSize.height) / 2
                                                    ,size.width - imageSize.width - barButtonLeftSpace)
     ];
    leftButton.frame = (CGRect)
    {
        .origin.x = 0,
        .origin.y = 0,
        .size     = size,
    };
    [leftButton addTarget:self action:@selector(leftBarButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    // 消除按钮响应bounds过大的问题
    UIView *backBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [backBtnView addSubview:leftButton];

    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backBtnView];

    //消除返回按钮左边空白
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -barButtonLeftSpace;
    self.navigationItem.leftBarButtonItems = [NSArray
                                              arrayWithObjects:negativeSpacer, leftItem, nil];

}

/**
 *  生成导航控制器Title视图
 *
 *  @param title 页面标题
 *
 *  @return Title视图
 */
- (UIView *)navigationTitleView:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,150,44)];
    label.text                      = title;
    label.font                      = [UIFont boldSystemFontOfSize:21];
    label.textAlignment             = NSTextAlignmentCenter;
    label.textColor                 = [UIColor whiteColor];
    label.backgroundColor           = [UIColor clearColor];
    label.adjustsFontSizeToFitWidth = YES;

    return label;
}
- (void)setnavigationView:(UIView *)customView
{
    [self.navigationItem setTitleView:customView];
}

- (void)leftBarButtonTouchUpInside:(id)sender
{
    if ([self.navigationController.viewControllers count] > 1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
}

- (void)rightBarButtonTouchUpInside:(id)sender{

}


@end
