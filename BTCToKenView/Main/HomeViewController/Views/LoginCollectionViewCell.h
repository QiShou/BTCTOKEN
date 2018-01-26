//
//  LoginCollectionViewCell.h
//  BTCToKenView
//
//  Created by wangyi on 2018/1/26.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseViewController;
@interface LoginCollectionViewCell : UICollectionViewCell
//邮箱
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;//tag 1001

@property (weak, nonatomic) IBOutlet UITextField *secTextField;//tag 1002

@property (weak, nonatomic) IBOutlet UIButton *forgitBtn;//tag 1001
@property (weak, nonatomic) IBOutlet UIButton *longinBtn;//tag 1002
@property (weak, nonatomic) IBOutlet UIButton *xieyiBtn;//tag 1003
@property (weak,nonatomic) BaseViewController *viewController;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labrlheigth;

@end
