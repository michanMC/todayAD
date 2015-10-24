//
//  SentriesTableViewCell.m
//  TodayAd
//
//  Created by MC on 15/10/17.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "SentriesTableViewCell.h"

@implementation SentriesTableViewCell

- (void)awakeFromNib {
    [_btn setImage:[UIImage imageNamed:@"off"] forState:UIControlStateNormal];
    [_btn setImage:[UIImage imageNamed:@"on"] forState:UIControlStateSelected];

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
