//
//  recom1TableViewCell.h
//  TodayAd
//
//  Created by michan on 15/9/1.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface recom1TableViewCell : UITableViewCell
@property(nonatomic,copy)NSString*headTitle;
@property(nonatomic,copy)NSString*subTitle;
@property(nonatomic,copy)NSString*imgViewStr;
@property(nonatomic,copy)NSString*phoneStr;
@property(nonatomic,copy)NSString*liulanStr;
@property(nonatomic,copy)NSString*timeStr;
@property(nonatomic,assign)BOOL isHot;
@property(nonatomic,copy)NSString *hotImgStr;

@end
