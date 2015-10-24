//
//  MyRelease1TableViewCell.h
//  TodayAd
//
//  Created by michan on 15/9/14.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyRelease1TableViewdetegate <NSObject>

-(void)titleStr:(NSString*)title;

@end






@interface MyRelease1TableViewCell : UITableViewCell
@property(nonatomic,weak)id<MyRelease1TableViewdetegate>delegate;
@property(nonatomic,strong)NSArray * titleArray;
@property(nonatomic,strong)NSArray * imgArray;
@property(nonatomic,strong)NSArray * title2Array;

@end
