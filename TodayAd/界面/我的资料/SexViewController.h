//
//  SexViewController.h
//  TodayAd
//
//  Created by 123 on 15/9/19.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "BaseViewController.h"

@protocol SexViewControllerdelegate <NSObject>

-(void)backMsg:(NSString*)msg;

@end

@interface SexViewController : BaseViewController
@property(weak,nonatomic)id<SexViewControllerdelegate>delegate;
@end
