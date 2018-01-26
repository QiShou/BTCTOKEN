//
//  LoginCollectionViewCell.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/26.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "LoginCollectionViewCell.h"
#import "LoginViewController.h"

@implementation LoginCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)clickBtn:(UIButton *)sender {
}
- (void)setViewController:(BaseViewController *)viewController {
    _viewController = viewController;
}

@end
