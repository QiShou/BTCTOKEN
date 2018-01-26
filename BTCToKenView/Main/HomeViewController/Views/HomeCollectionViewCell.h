//
//  HomeCollectionViewCell.h
//  BTCToKenView
//
//  Created by wangyi on 2018/1/24.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseViewController;
@interface HomeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic) BaseViewController *viewController;
- (void)requestDataWithTitleString:(NSString *)string;
@end
