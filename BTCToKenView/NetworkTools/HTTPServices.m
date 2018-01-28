//
//  HTTPServices.m
//  JFW
//
//  Created by wangyi on 2017/9/15.
//  Copyright © 2017年 jieshun. All rights reserved.
//

#import "HTTPServices.h"
#import "UIDevice+Version.h"
#import "NSDictionary+JsonString.h"

/// 请求超时时间
#define kHttpTimeoutInterval  25.0
@implementation HTTPServices

static HTTPServices *_defaultManager = nil;
static AFHTTPSessionManager *_httpRequestManager;
#define MAIN_URL                @"http://120.78.210.154:8080"//http网络请求

+ (instancetype)sharedInstance {

    return [[self alloc] init];
}

- (instancetype)init {

    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _defaultManager = [super init];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        config.timeoutIntervalForRequest = kHttpTimeoutInterval;
        _httpRequestManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
        _httpRequestManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", @"text/json",@"text/html", nil];
        _httpRequestManager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        _httpRequestManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    });
    
    return _defaultManager;
    
}

- (void)GET:(NSString *)urlString paramaters:(id)paramters success:(void (^)(HTTPServices *request))success failure:(void(^)(NSError *error))failure {
    NSURLSession *session = [NSURLSession sharedSession];

    
    NSURL *url = [NSURL URLWithString:@""];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        responseData = data;
        responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                failure(error);
            } else {
            
                success(self);
            }
        });
    }];
    
    [dataTask resume];
}


//key = value & key1 = value &
- (NSString *)paramterStringWithParamter:(id)paramters
{
    NSMutableString *string = [NSMutableString string];
    
    if ([paramters isKindOfClass:[NSDictionary class]])
    {
        //获取字典所有的key
        NSArray *allKeys = [paramters allKeys];
        
        //遍历字典的key-value
        for (int i = 0; i < allKeys.count; i++)
        {
            //遍历获取字典的key
            NSString *key = allKeys[i];
            
            //拼接地址
            if (i == [paramters count] - 1)
            {
                [string appendFormat:@"%@=%@",key,paramters[key]];
            }
            else
            {
                [string appendFormat:@"%@=%@&",key,paramters[key]];
            }
        }
        
        return string;
    }
    
    return nil;
}


/**
 *  post请求
 *
 *  @param urlString <#urlString description#>
 *  @param paramters <#paramters description#>
 *  @param success   <#success description#>
 *  @param failure   <#failure description#>
 */
- (void)POST:(NSString *)urlString paramaters:(id)paramters success:(void (^)(HTTPServices *request))success failure:(void(^)(NSError *error))failure
{
    //替代NSURLConnection
    NSURLSession *session = [NSURLSession sharedSession];
    
    //获取参数
    NSString *paramterString;
    
    //如果有参数
    if (paramters)
    {
        paramterString = [self paramterStringWithParamter:paramters];
    }
    
    //对url编码
    NSURL *url = [NSURL URLWithString:[self urlEncodingWihtUrlString:urlString]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //HTTPMethod默认是get,如果是post，必须显式修改为POST
    request.HTTPMethod = @"POST";
    //把参数添加到请求body
    request.HTTPBody = [paramterString dataUsingEncoding:NSUTF8StringEncoding];
    
    //创建一个任务
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                      {
                                          //赋值
                                          responseData = data;
                                          responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          
                                          dispatch_async(dispatch_get_main_queue()
                                                         , ^{
                                                             //失败回调
                                                             if (error)
                                                             {
                                                                 failure(error);
                                                             }
                                                             else
                                                             {
                                                                 success(self);
                                                             }
                                                         });
                                      }];
    
    //发送请求
    [dataTask resume];
}

/**
 *  对url的字符串进行编码
 *
 *  @param urlString <#urlString description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)urlEncodingWihtUrlString:(NSString *)urlString
{
    if ([UIDevice currentSystemVersion] >= 9.0)
    {
        urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    }
    else
    {
        urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    return urlString;
}




// POST请求
- (NSURLSessionDataTask * _Nullable)postRequestWithURLSuffix:(NSString* _Nullable)strURLSuffix
                                                  parameters:(id)param
                                                     success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                                                     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
    
    
    
    NSString *strURL;
    if (strURLSuffix) {
        strURL = [MAIN_URL stringByAppendingString:strURLSuffix];
    } else {
        strURL = MAIN_URL;
    }
    
    //设置请求头 
    if ([strURLSuffix isEqualToString:AC_Logout]) {
        NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"HIPPOWDTOKEN"];
        [_httpRequestManager.requestSerializer setValue:string forHTTPHeaderField:@"HIPPOWDTOKEN"];
    }
    
//    [_httpRequestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

//    [_httpRequestManager.requestSerializer addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];//加上这句话

//    NSData *dictData = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *jsonString = [[NSString alloc]initWithData:dictData encoding:NSUTF8StringEncoding];
//    NSString *jsonString =  [self convertToJsonData:param];
    
    return [_httpRequestManager POST:strURL parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(task, error);
        }
    }];
    
    
}
-(NSString *)convertToJsonData:(NSDictionary *)dict {
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

@end
