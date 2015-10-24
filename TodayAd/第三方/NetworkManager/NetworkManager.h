//
//  NetworkManager.h
//  FishingJoy
//
//  Created by expro on 14-1-9.
//  Copyright (c) 2014年 expro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Reachability.h"



@class ExproHttpClient;

/**
 *  请求成功后的数据简单处理后的回调
 *
 *  @param resultDic 返回的字典对象
 */
typedef void (^HttpResponseSucBlock) (NSDictionary *resultDic);
/**
 *  请求失败后的响应及错误实例
 *
 *  @param operation 响应
 *  @param erro      错误实例
 */
typedef void (^HttpResponseErrBlock) (AFHTTPRequestOperation *operation,NSError *error,NSString *description);


typedef void (^ADBlock)(NSString *imageUrl);

@interface NetworkManager : NSObject<UIAlertViewDelegate>

@property ExproHttpClient *httpClient;
/**
 *  诊断网络状态，并且适时提出网络异常报警
 */
@property Reachability *reachability;



@property BOOL isShowNetAlert;

@property (nonatomic, strong) NSDictionary *paramdic;
@property (nonatomic, assign) BOOL needSeesion;

+ (instancetype)instanceManager;

- (BOOL)isExistenceNetwork;

- (BOOL) IsEnableWIFI;

- (BOOL) IsEnable3G;
/**
 *  请求网络接口,返回请求的响应接口,并作初期数据处理
 *
 *  @param webApi        网络请求的接口
 *  @param para          请求所带的参数
 *  @param completeBlock 成功请求后得到的响应,此响应包括服务器业务逻辑异常结果,只接收服务器业务逻辑状态码为200的结果
 *  @param errorBlock    服务器响应不正常,网络连接失败返回的响应结果
 */
- (void)requestWebWithParaWithURL:(NSString*)webApi Parameter:(NSDictionary *)para Finish:(HttpResponseSucBlock)completeBlock Error:(HttpResponseErrBlock)errorBlock;

- (void)requestWebWithParaWithURL_NotResponseJson:(NSString*)webApi Parameter:(NSDictionary *)para Finish:(HttpResponseSucBlock)completeBlock Error:(HttpResponseErrBlock)errorBlock;

/**
 *  请求网络接口,返回请求的响应接口,并作初期数据处理
 *
 *  @param webApi        网络请求的接口
 *  @param para          请求所带的参数
 *  @param completeBlock 成功请求后得到的响应,此响应包括服务器业务逻辑异常结果,只接收服务器业务逻辑状态码为200的结果
 *  @param errorBlock    服务器响应不正常,网络连接失败返回的响应结果
 */
- (void)requestGETWebWithParaWithURL:(NSString*)webApi Parameter:(NSDictionary *)para Finish:(HttpResponseSucBlock)completeBlock Error:(HttpResponseErrBlock)errorBlock;








//获取所有的需要的参数
- (void)getAllParamList;

- (void)setSessionID:(NSString *)sessionID;

@end

@interface ExproHttpClient : AFHTTPRequestOperationManager
//AFHTTPRequestOperationManager
+ (instancetype)sharedClient;

@end

