//
//  Seach1TableViewCell.h
//  TodayAd
//
//  Created by michan on 15/9/12.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Seach1TableViewCellDelegate <NSObject>

-(void)actionBtn:(UIButton*)btn;

@end
@interface Seach1TableViewCell : UITableViewCell
@property(nonatomic,weak)id<Seach1TableViewCellDelegate>delegate;
@property(nonatomic,strong)NSArray *tilteArray;
@end
