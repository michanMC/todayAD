//
//  Seach1TableViewCell.m
//  TodayAd
//
//  Created by michan on 15/9/12.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "Seach1TableViewCell.h"

@interface Seach1TableViewCell (){
    
    
    UIView * _bgView;
    
}

@end
@implementation Seach1TableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 3 * 25 + 4 * 10 + 10)];
        [self.contentView addSubview:_bgView];
    }
    return self;
}
-(void)setTilteArray:(NSArray *)tilteArray
{
    
    CGFloat x = (Main_Screen_Width - 3*70) / 4;
    CGFloat offx = x;
  //  CGFloat ViewH = 3 * 25 + 4 * 10 + 10;
    CGFloat width = 70;
    CGFloat y = 10;
    NSInteger index = 0;
    for (int i = 0; i < 3; i ++) {
        for (int j = 0; j < 3; j++) {
            NSString * str = tilteArray[index];
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, 25)];
            [btn setTitle:str forState:0];
            btn.tag = index;
            ViewRadius(btn, 5);
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [btn setTitleColor:[UIColor grayColor] forState:0];
            btn.backgroundColor= [UIColor groupTableViewBackgroundColor];
            [btn addTarget:self action:@selector(seleBtn:) forControlEvents:UIControlEventTouchUpInside];
            [_bgView addSubview:btn];
            x += width + offx;
            index++;

        }
        x = offx;
        y += 25 + 10;
        
    }
    
    
    
}
-(void)seleBtn:(UIButton*)btn{
    [_delegate actionBtn:btn];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
