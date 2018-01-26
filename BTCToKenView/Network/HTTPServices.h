//
//  HTTPServices.h
//  JFW
//
//  Created by wangyi on 2017/9/15.
//  Copyright © 2017年 jieshun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//#define MAIN_URL @"http://10.101.90.174:8081/js-service/query"


@interface HTTPServices : NSObject {
    NSString *responseString;
    NSData *responseData;
    
    AFHTTPSessionManager *_httpRequestManager;

}

+(instancetype _Nullable )sharedInstance;

- (void)GET:(NSString *)urlString paramaters:(id)paramters success:(void (^)(HTTPServices *request))success failure:(void(^)(NSError *error))failure ;


- (void)POST:(NSString *)urlString paramaters:(id)paramters success:(void (^)(HTTPServices *request))success failure:(void(^)(NSError *error))failure;

// POST请求
- (NSURLSessionDataTask * _Nullable)postRequestWithURLSuffix:(NSString* _Nullable)strURLSuffix
                                                  parameters:(NSDictionary* _Nullable)param
                                                     success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                                                     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

@end
