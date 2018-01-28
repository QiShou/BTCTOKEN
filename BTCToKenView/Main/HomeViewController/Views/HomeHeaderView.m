//
//  HomeHeaderView.m
//  BTCToKenView
//
//  Created by wangyi on 2018/1/28.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "HomeHeaderView.h"

@implementation HomeHeaderView



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"HomeHeaderView" owner:self options:nil] firstObject];
        self.frame = frame;
    }
    return self;
}

- (void)setUpUI {
    
}
- (IBAction)clickBtn:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(didSearchWithContent: btn:)]) {
        [self.delegate didSearchWithContent:self btn:sender];
    }
}

- (IBAction)clickSueger:(UISegmentedControl *)sender {
    if ([self.delegate respondsToSelector:@selector(didSearchWithContent:segmentController:)]) {
        [self.delegate didSearchWithContent:self segmentController:sender];
    }
}

@end
