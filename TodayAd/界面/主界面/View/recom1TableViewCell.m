//
//  recom1TableViewCell.m
//  TodayAd
//
//  Created by michan on 15/9/1.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "recom1TableViewCell.h"

@interface recom1TableViewCell (){
    UILabel * _titleLbl;
    UILabel * _title_sub_Lbl;
    UIImageView *_imgView;
    UILabel *_liulanLbl;
    UILabel *_phoneLbl;
    UIImageView * _hotimgView;
    UILabel * _timeLbl;
    CGFloat _titleH;
    
}

@end


@implementation recom1TableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGFloat x = 10;
        CGFloat y = 10;
        CGFloat width = Main_Screen_Width - 20 - (Main_Screen_Width - 40)/3 - 10;
        CGFloat height = 20;
        _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
        _titleLbl.font = [UIFont systemFontOfSize:14];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.numberOfLines = 0;
        [self.contentView addSubview:_titleLbl];
        
        width = (Main_Screen_Width - 40)/3;
        x = Main_Screen_Width - 10 - width;
        height = 70;
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        _imgView.image = [UIImage imageNamed:@"home_img_default"];
        [self.contentView addSubview:_imgView];
        x = 10;
        y = 40;
        width = Main_Screen_Width - 20 - width - 10;
        height = 20;
        _title_sub_Lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
        _title_sub_Lbl.font = [UIFont systemFontOfSize:12];
        _title_sub_Lbl.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_title_sub_Lbl];
        x = 10;
        width = 15;
        height = 15;
        y = 100 - height - 5;
        _hotimgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
       // _hotimgView.backgroundColor = AppCOLOR;
        _hotimgView.image = [UIImage imageNamed:@"hot"];
        [self.contentView addSubview:_hotimgView];
        x += width + 30;
        UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        imgview.image = [UIImage imageNamed:@"eye"];
        [self.contentView addSubview:imgview];
        x += width;
        width = 30;
        _liulanLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
        _liulanLbl.font = [UIFont systemFontOfSize:12];
        _liulanLbl.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_liulanLbl];
        x += width + 10;
        width = 15;
        imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        imgview.image = [UIImage imageNamed:@"phone1"];
        [self.contentView addSubview:imgview];
        x += width;
        width = 30;
        _phoneLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
        _phoneLbl.font = [UIFont systemFontOfSize:12];
        _phoneLbl.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_phoneLbl];
        x += width + 10 ;//Main_Screen_Width - 10 - width;
        width = (Main_Screen_Width - 40)/3;

       // height = 20;
        _timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
       // _timeLbl.textAlignment = NSTextAlignmentCenter;
        _timeLbl.font = [UIFont systemFontOfSize:12];
        _timeLbl.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_timeLbl];
        
    }
    return self;
}
-(void)setLiulanStr:(NSString *)liulanStr
{
    _liulanLbl.text = liulanStr;
}
-(void)setPhoneStr:(NSString *)phoneStr
{
    _phoneLbl.text = phoneStr;
}
-(void)setTimeStr:(NSString *)timeStr
{
    _timeLbl.text  = timeStr;
}
-(void)setHeadTitle:(NSString *)headTitle
{
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat width = Main_Screen_Width - 20 - (Main_Screen_Width - 40)/3 - 10;
   _titleH = [MCIucencyView heightforString:headTitle andWidth:width fontSize:14];
    _titleLbl.frame = CGRectMake(x, y, width, _titleH);
    _titleLbl.text = headTitle;
}
-(void)setSubTitle:(NSString *)subTitle
{
    CGFloat x = 10;
    CGFloat y = _titleH + 15; //_timeLbl.frame.size.height + 10 + 5;
    CGFloat width = Main_Screen_Width - 20 - (Main_Screen_Width - 40)/3 - 10;
    _title_sub_Lbl.frame = CGRectMake(x, y, width, 15);
    _title_sub_Lbl.text = subTitle;
    
}
-(void)setIsHot:(BOOL)isHot
{
    _hotimgView.hidden = isHot;
}
-(void)setHotImgStr:(NSString *)hotImgStr
{
    _hotimgView.image = [UIImage imageNamed:hotImgStr];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
