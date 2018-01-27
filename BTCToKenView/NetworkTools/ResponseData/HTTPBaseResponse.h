//
//  JFWHTTPBaseResponse.h
//  JFW
//
//  Created by wangyi on 2017/9/18.
//  Copyright © 2017年 jieshun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPBaseResponse : NSObject<NSCoding>
@property (nonatomic, strong) NSString *responseCode;
@property (nonatomic, strong) NSString *responseMsg;
@end
