//
//  MyReleaseTableViewCell.h
//  TodayAd
//
//  Created by michan on 15/9/6.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol MyReleaseTableViewCellDelegate <NSObject>
//
//-(void)setectBtn:(NSInteger)index;
//
//@end

@interface MyReleaseTableViewCell : UICollectionViewCell
-(void)prepareUI:(NSInteger)index;
@property(nonatomic,copy)NSString*titleStr;
@property(nonatomic,copy)NSString*imgStr;
//@property(nonatomic,weak)id<MyReleaseTableViewCellDelegate>delegate;

@end
