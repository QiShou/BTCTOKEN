//
//  JSHVisitMenuView.h
//  JSH
//
//  Created by K on 2017/7/18.
//  Copyright © 2017年 wangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

//回调
typedef void(^menuViewDidSelectedAtIndexHandle)(NSInteger index);

@interface JSHVisitMenuView : UIView
/**
 *  标题
 */
@property (nonatomic, strong) NSArray *titleItems;

/**
 *  选中的字体颜色
 */
@property (nonatomic, strong) UIColor *selectedTextColor;

/**
 *  字体颜色
 */
@property (nonatomic, strong) UIColor *unSelectedtextColor;

/**
 *  选中的按钮的下标
 */
@property (nonatomic) NSInteger selectedIndex;

/**
 *  选中的按钮的下方选中视图
 */
@property (nonatomic, weak) UIView *lineView;

/**
 *  按钮宽度
 */
@property (nonatomic, assign) CGFloat buttonWidth;


- (void)setMenuViewDidSelectedAtIndex:(menuViewDidSelectedAtIndexHandle)handle;

-(void)lineDidScroll:(CGFloat)rate;

@end
