//
//  RegisterTableViewCell.m
//  TodayAd
//
//  Created by 123 on 15/9/18.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "RegisterTableViewCell.h"

@implementation RegisterTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [_gerenBtn setImage:[UIImage imageNamed:@"个人用户（选中）"] forState:UIControlStateSelected];
     [_gongsiBtn setImage:[UIImage imageNamed:@"公司用户（选中）"] forState:UIControlStateSelected];
}
- (IBAction)gerenAction:(id)sender {
    if (_gerenBtn.selected) {
        _gerenBtn.selected = NO;
    }
    else
    {
        _gerenBtn.selected = YES;
        _gongsiBtn.selected = NO;
  
    }
}
- (IBAction)gongsiaction:(id)sender {
    if (_gongsiBtn.selected) {
        _gongsiBtn.selected = NO;
    }
    else
    {
        _gongsiBtn.selected = YES;
        _gerenBtn.selected = NO;
        
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
