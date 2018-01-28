//
//  HomeHeaderView.h
//  BTCToKenView
//
//  Created by wangyi on 2018/1/28.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeHeaderView;

@protocol BaseHomeHeaderDelegate <NSObject>

@optional
- (void)didSearchWithContent:(HomeHeaderView *)view btn:(UIButton *)sender;
- (void)didSearchWithContent:(HomeHeaderView *)view segmentController:(UISegmentedControl *)sender;

@end


@interface HomeHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UIButton *massgeBtn;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak,nonatomic) id<BaseHomeHeaderDelegate> delegate;

@end
