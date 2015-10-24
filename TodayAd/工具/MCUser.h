//
//  MCUser.h
//  Hair
//
//  Created by michan on 15/6/7.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CloudKit/CloudKit.h>
/**
 位置信息
 */
@interface MyLocation : NSObject

@property(nonatomic,assign)CLLocationCoordinate2D  startCoordinate;
@property(nonatomic,assign)CLLocationCoordinate2D  destinationCoordinate;

//度
@property(assign) CGFloat   lo;
//度
@property(assign) CGFloat   la;
//城市
@property(retain)  NSString *city;
//街道
@property(retain)  NSString *street;
//省份
@property(retain)  NSString *province;
//区
@property(retain)  NSString *county;
//城市代码
@property(retain)  NSString *code;
//省份代码
@property(retain)  NSString *province_code;
@property(retain)  NSString *address;//详细地址

@end
@class MyLocation;
@interface MCUser : NSObject

@property(nonatomic,retain)MyLocation *  myLocation;
/**
 用户id
 */
@property(nonatomic,copy)NSString*  userid;//用户账号
/**
 用户手机号
 */
@property(nonatomic,copy)NSString*  userphone;//

+(MCUser *)sharedInstance;


@end
