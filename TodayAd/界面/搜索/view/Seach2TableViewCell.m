//
//  Seach2TableViewCell.m
//  TodayAd
//
//  Created by michan on 15/9/14.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "Seach2TableViewCell.h"

@implementation Seach2TableViewCell

- (void)awakeFromNib {
    // Initialization code
    ViewRadius(_imgView, 5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
