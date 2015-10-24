//
//  MeData2TableViewCell.m
//  TodayAd
//
//  Created by 123 on 15/9/19.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MeData2TableViewCell.h"

@interface MeData2TableViewCell ()<UITextViewDelegate>{
    
}

@end

@implementation MeData2TableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textView = [[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(10, 5, Main_Screen_Width - 20, 100)];
        //_textView.delegate  = self;
        _textView.placeholder = @"输入个性签名...";
        [self.contentView  addSubview:_textView];
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
