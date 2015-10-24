//
//  recom3TableViewCell.m
//  TodayAd
//
//  Created by michan on 15/9/1.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "recom3TableViewCell.h"
@interface recom3TableViewCell (){
    UILabel * _titleLbl;
    UILabel * _title_sub_Lbl;
    UIImageView * _imgView;
    UILabel *_liulanLbl;
    UILabel *_phoneLbl;
    UIImageView * _hotimgView;
    UILabel * _timeLbl;
    CGFloat _titleH;
    
}

@end

@implementation recom3TableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGFloat x = 10;
        CGFloat y = 0;
        CGFloat width = Main_Screen_Width - 20;
        CGFloat height = 20;
        _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
        _titleLbl.font = [UIFont systemFontOfSize:14];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.textAlignment =NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLbl];
        
        x = 10;
        width = Main_Screen_Width - 20;
        height = 70;
        y = 20;
           _imgView  = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
            _imgView.image = [UIImage imageNamed:@"home_banner_img_default"];
            [self.contentView addSubview:_imgView];
           // x += width + 10;
            
        //        x = 10;
        //        y = 40;
        //        width = Main_Screen_Width - 20 - 90;
        //        height = 20;
        //        _title_sub_Lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
        //        _title_sub_Lbl.font = [UIFont systemFontOfSize:12];
        //        _title_sub_Lbl.textColor = [UIColor lightGrayColor];
        //        [self.contentView addSubview:_title_sub_Lbl];
        x = 10;
        width = 15;
        height = 15;
        y = 120 - height - 5;
        _hotimgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
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
       // y = 120 - 25;x
        x += width + 10;
        width = (Main_Screen_Width - 40)/3;
       // x = Main_Screen_Width - 10 - (Main_Screen_Width - 40)/3;
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
    //    CGFloat x = 10;
    //    CGFloat y = 10;
    //    CGFloat width = Main_Screen_Width - 20 - 90;
    //    _titleH = [MCIucencyView heightforString:headTitle andWidth:Main_Screen_Width - 20 - 90 fontSize:14];
    //    _titleLbl.frame = CGRectMake(x, y, width, _titleH);
    _titleLbl.text = headTitle;
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
