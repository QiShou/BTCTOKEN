//
//  JSHVisitMenuView.m
//  JSH
//
//  Created by K on 2017/7/18.
//  Copyright © 2017年 wangyi. All rights reserved.
//

#import "JSHVisitMenuView.h"

#define ButtonTag 34567
//按钮宽度
#define kButtonWidth SCREEN_WIDTH/4.0
#define kLineViewHeight 2
#define kLineViewWidth 70

@interface JSHVisitMenuView (){
    menuViewDidSelectedAtIndexHandle _menuViewDidSelectedAtIndexHandle;
}

@property (nonatomic, weak) UIScrollView *menuScrollView;

@property (nonatomic,strong) NSMutableArray * widthArr;

//line滑动带动画
@property (nonatomic, assign) BOOL isAnimate;

@end

@implementation JSHVisitMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _unSelectedtextColor = kWordBlackColor;
        _selectedTextColor = kMainGreenColor;
        
        if (!self.buttonWidth) {
            self.buttonWidth = kButtonWidth;
        }
    }
    return self;
}

- (UIScrollView *)menuScrollView
{
    if (!_menuScrollView)
    {
        UIScrollView *scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        scr.showsHorizontalScrollIndicator = NO;
        scr.bounces = NO;
        adjustsScrollViewInsets(scr);
        [self addSubview:scr];
        
        _menuScrollView = scr;
    }
    
    return _menuScrollView;
}

-(UIView *)lineView{
    
    if (!_lineView) {
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake((self.buttonWidth-kLineViewWidth)/2.0, self.frame.size.height - kLineViewHeight - 3, kLineViewWidth, kLineViewHeight)];
        view.backgroundColor = kMainGreenColor;
        view.layer.cornerRadius = 1;
        view.layer.masksToBounds = YES;
        [_menuScrollView addSubview:view];
        
        _lineView = view;
    }
    return _lineView;
}

-(NSMutableArray *)widthArr{

    if (!_widthArr) {
        
        _widthArr = [NSMutableArray array];
    }
    return _widthArr;
}

#pragma mark - setter方法
- (void)setTitleItems:(NSArray *)titleItems
{
    [self.widthArr removeAllObjects];
    _titleItems = titleItems;
    
    //设置滚动范围
    self.menuScrollView.contentSize = CGSizeMake(self.buttonWidth*titleItems.count, self.menuScrollView.frame.size.height);
    //动态创建按钮
    for (int i = 0; i < titleItems.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(self.buttonWidth * i, 0, self.buttonWidth, self.frame.size.height);
        [button setTitle:titleItems[i] forState:UIControlStateNormal];
        //按钮标题颜色
        [button setTitleColor:_selectedTextColor forState:UIControlStateSelected];
        [button setTitleColor:_unSelectedtextColor forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        button.tag = i + ButtonTag;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.menuScrollView addSubview:button];
        
//        CGSize size = [titleItems[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |  NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]} context:nil].size;
        CGSize size =CGSizeMake( self.buttonWidth,1);
        [self.widthArr addObject:[NSNumber numberWithFloat:size.width]];
    }
}

- (void)setMenuViewDidSelectedAtIndex:(menuViewDidSelectedAtIndexHandle)handle
{
    _menuViewDidSelectedAtIndexHandle = handle;
}

#pragma mark - 菜单按钮点击
- (void)buttonClick:(UIButton *)button
{
    self.isAnimate = YES;
    
    NSInteger index = button.tag - ButtonTag;
    
    //1.按钮的中心点
    CGFloat buttonCenterX = button.center.x;
    
    //2.处理按钮选中
    [self menuButtonClickHandle:button];
    
    //3.滚动视图偏移量的处理
    [self menuScrollViewContentOffsetHandleWithCenterX:buttonCenterX];
    
    //4.记录当前的index
    _selectedIndex = index;
    
    //5.回调
    if (_menuViewDidSelectedAtIndexHandle)
    {
        _menuViewDidSelectedAtIndexHandle(index);
    }
    
    CGFloat lineWidth = [self.widthArr[index] floatValue] + 5;
    [UIView animateWithDuration:0.3 animations:^{
        
        self.lineView.frame = CGRectMake(index * self.buttonWidth + (self.buttonWidth - lineWidth)/2.0, self.frame.size.height - kLineViewHeight - 3, lineWidth, kLineViewHeight);
    } completion:^(BOOL finished) {
        self.isAnimate = NO;
    }];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    //1.清除所有按钮的状态
    [self clearAllButtonSelectedStatus];
    
    //2.修改当前选中按钮的selected
    UIButton *btn = [self.menuScrollView viewWithTag:selectedIndex + ButtonTag];
    btn.selected = YES;
    
    //3.修改偏移
    [self menuScrollViewContentOffsetHandleWithCenterX:btn.center.x];
    
    CGFloat lineWidth = [self.widthArr[selectedIndex] floatValue] + 5;
    self.lineView.frame = CGRectMake(selectedIndex * self.buttonWidth + (self.buttonWidth - lineWidth)/2.0, self.frame.size.height - kLineViewHeight - 3, lineWidth, kLineViewHeight);
}

#pragma mark - 清除所有按钮的状态
- (void)clearAllButtonSelectedStatus
{
    for (int i = 0; i < _titleItems.count; i++)
    {
        UIButton *btn = [self.menuScrollView viewWithTag:i+ButtonTag];
        btn.selected = NO;
    }
}

#pragma mark - 处理按钮选中
- (void)menuButtonClickHandle:(UIButton *)button
{
    //清除所有按钮的状态
    [self clearAllButtonSelectedStatus];
    
    button.selected = YES;
}

#pragma mark - 滚动视图偏移量的处理
- (void)menuScrollViewContentOffsetHandleWithCenterX:(CGFloat)centerX
{
    //滚动视图X的偏移量 = 按钮的中心点x - 当前屏幕宽度的一半
    CGFloat xOffset = centerX - self.menuScrollView.frame.size.width/2;
    
    //左边偏移限制:如果按钮的中心点小于屏幕的一半。不能偏移。
    if (centerX < self.menuScrollView.frame.size.width/2)
    {
        xOffset = 0;
    }
    else if (centerX > self.menuScrollView.contentSize.width - self.menuScrollView.frame.size.width/2)
    {
        //最大偏移量
        xOffset = self.menuScrollView.contentSize.width - self.menuScrollView.frame.size.width;
    }
    
    //修改偏移量
    [self.menuScrollView setContentOffset:CGPointMake(xOffset, 0) animated:YES];
}

#pragma mark - line滚动
-(void)lineDidScroll:(CGFloat)rate{

    if ((rate - (int)rate) == 0 && rate != _selectedIndex) {
//        //清除所有按钮的状态
//        [self clearAllButtonSelectedStatus];
//        //修改当前选中按钮的selected
//        UIButton *btn = [self.menuScrollView viewWithTag:rate + ButtonTag];
//        btn.selected = YES;
        self.selectedIndex = rate;
    }
    if (!self.isAnimate) {
        CGFloat lineWidth = [self.widthArr[_selectedIndex] floatValue] + 5;
        self.lineView.frame = CGRectMake(rate * self.buttonWidth + (self.buttonWidth - lineWidth)/2.0, self.frame.size.height - kLineViewHeight - 3, lineWidth, kLineViewHeight);
    }
}

@end
