//
//  BtcDataResponse.h
//  BTCToKenView
//
//  Created by wangyi on 2018/1/27.
//  Copyright © 2018年 wangyi. All rights reserved.
//

#import "HTTPBaseResponse.h"


@interface BtcDataList :HTTPBaseResponse
@property (nonatomic, strong) NSString *pageNo;
@property (nonatomic, strong) NSString *pageSize;
@property (nonatomic, strong) NSString *pageView;
@property (nonatomic, strong) NSString *property;
//@property (nonatomic, strong) NSString *totalCount;
//@property (nonatomic, strong) NSString *property;
//@property (nonatomic, strong) NSString *message;
//@property (nonatomic, strong) NSString *property;
@end

@interface BtcDataResponse : HTTPBaseResponse



@end
