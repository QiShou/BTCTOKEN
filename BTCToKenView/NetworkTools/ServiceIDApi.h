//
//  ServiceIDApi.h
//  JFW
//
//  Created by OTgiraffe on 17/3/27.
//  Copyright © 2017年 jieshun. All rights reserved.
//

#ifndef ServiceIDApi_h
#define ServiceIDApi_h
/**
 *  移动用户登录到云平台
 */
static NSString * const AC_Register = @"/tvc/user/register.do";

/**
 *  移动用户登录
 */
static NSString * const AC_Login = @"/tvc/user/login.do";

/**
 *  新增/修改项目信息接口
 */
static NSString * const AC_Logout = @"/tvc/user/logout.do";
/**
 *  新增/修改停车场项目信息接口（新）
 */
static NSString * const AC_JSSERVICE_COLLECTPROJECT = @"ac.jsservice.collectproject";

/**
 *  获取我采集的项目
 */
static NSString * const AC_JSSERVICE_GETPROJECT = @"ac.jsservice.getproject";

/**
 *  根据ID查询项目信息接口
 */
static NSString * const AC_JSSERVICE_GETPROJECTBYID = @"ac.jsservice.getprojectbyid";

/**
 *  售后派工接口
 */
static NSString * const AC_JSSERVICE_AFTERSALEDISPATCH = @"ac.jsservice.aftersaledispatch";
/**
 *  工单详情接口
 */
static NSString * const AC_JSSERVICE_GETJOBSINGLE = @"ac.jsservice.getjobsingle";
/**
 *  产品接口
 */
static NSString * const AC_JSSERVICE_GETPRODUCT = @"ac.jsservice.getproduct";
/**
 *  产品名查询接口
 */
static NSString * const AC_JSSERVICE_GETPRODUCTBYNAME = @"ac.jsservice.getproductbyname";

/**
 *  意见反馈接口
 */
static NSString * const AC_JSSERVICE_FEEDBACK = @"ac.jsservice.feedback";

/**
 *  用户头像上传接口
 */
static NSString * const AC_JSSERVICE_UPDATEHEADPHOTO = @"ac.jsservice.updateheadphoto";

/**
 *  重置/修改密码接口
 */
static NSString * const AC_JSSERVICE_UPDATEUSERPASS = @"ac.jsservice.updateuserpass";

/**
 *  获取验证码接口
 */
static NSString * const AC_JSSERVICE_GETVERIFYCODE = @"ac.jsservice.getverifycode";
/**
 *  工单服务结束接口
 */
static NSString * const AC_JSSERVICE_JOBSINGLEEND = @"ac.jsservice.jobsingleend";

/**
 *  用户轨迹上传
 */
static NSString * const AC_JSSERVICE_UPTRAJECTORY = @"ac.jsservice.uptrajectory";

/**
 *  工单处理结果修改
 */
static NSString * const AC_JSSERVICE_JOBSINGLEENDEDIT = @"ac.jsservice.jobsingleendedit";
/**
 *  工单状态处理接口
 */
static NSString * const AC_JSSERVICE_JOBSINGLESTATUS = @"ac.jsservice.jobsingleStatus";



/**
 *  获取用户列表接口(转派)
 */
static NSString * const AC_JSSERVICE_GETUSERLIST = @"ac.jsservice.getuserlist";
/**
 *  工单转派接口
 */
static NSString * const AC_JSSERVICE_JOBMOVEUSER = @"ac.jsservice.jobmoveuser";
/**
 *  知识学习接口
 */
static NSString * const AC_JSSERVICE_GETLORE = @"ac.jsservice.getlore";
/**
 *  知识学习分类接口
 */
static NSString * const AC_JSSERVICE_GETLORETYPE = @"ac.jsservice.getloretype";
/**
 *  license申请接口
 */
static NSString * const AC_JSSERVICE_APPLYLIC = @"ac.jsservice.applylic";
/**
 *  密钥系统登记工号接口
 */
static NSString * const AC_JSSERVICE_CRYPTREGISTER = @"ac.jsservice.cryptregister";
/**
 *  密钥系统注销工号接口
 */
static NSString * const AC_JSSERVICE_CRYPTCANCEL = @"ac.jsservice.cryptcancel";
/**
 *  查询停车场项目信息接口（单个和历史记录）
 */
static NSString * const AC_JSSERVICE_QUERYPROJECTINFO = @"ac.jsservice.queryprojectinfo";


/////////////////////////////////////推送/////////////////////////////////////////
/**
 *  推送内容
 */
static NSString * const JS_MSGPUSH_PUSH = @"JS_MSGPUSH_PUSH";

/***************************************  HTTP 网络请求拼接参数 ************************************************/

/**
 *  反馈问题
 */
static NSString * const HTTP_UserAuth = @"/query/userAuth";
/**
 *  信息列表
 */
static NSString * const HTTP_ProblemMessage = @"/query/message";



#endif /* ServiceIDApi_h */
