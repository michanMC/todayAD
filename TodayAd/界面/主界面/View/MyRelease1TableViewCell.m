//
//  MyRelease1TableViewCell.m
//  TodayAd
//
//  Created by michan on 15/9/14.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MyRelease1TableViewCell.h"

@interface MyRelease1TableViewCell (){
    UIView * _bgview;
    NSArray * _array;
    
}

@end

@implementation MyRelease1TableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _bgview  =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 80)];
       // _bgview.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:_bgview];
    }
    return self;
}
-(void)setTitleArray:(NSArray *)titleArray{
    _array = titleArray;
    _bgview.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 100);
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat width = (Main_Screen_Width - 3 * 10)/ 2;
    CGFloat height = 100 - 20;

    for (int i = 0; i < titleArray.count; i++) {
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        view.backgroundColor = [UIColor whiteColor];
        if (i == 0)
            view.backgroundColor = RGBCOLOR(235, 251, 250);
        else
            view.backgroundColor = RGBCOLOR(255, 237, 237);
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake((width - 30)/2, (height - 30 - 30)/2, 30, 30)];
        imgView.image = [UIImage imageNamed:_imgArray[i]];
        [view addSubview:imgView];
        UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, height - 20 - 10, width, 20)];
        lbl.text = titleArray[i];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor = [UIColor blackColor];
        [view addSubview:lbl];
        [_bgview addSubview:view];
        x += 10+width;
        UIButton * btn = [[UIButton alloc]initWithFrame:view.bounds];
        btn.tag = i;
        [btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }
    
    
}
-(void)setTitle2Array:(NSArray *)title2Array{
    _array = title2Array;

    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = (Main_Screen_Width - 3 * 0.5)/ 4;
    CGFloat height = 80;
    
    for (int i = 0; i < title2Array.count; i++) {
        
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        view.backgroundColor = [UIColor whiteColor];

        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake((width - 25)/2, (height - 30 -25)/2, 25, 25)];
        imgView.image = [UIImage imageNamed:_imgArray[i]];
        [view addSubview:imgView];
        UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, height - 30  - 5, width, 20)];
        lbl.text = title2Array[i];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.font = [UIFont systemFontOfSize:13];
        lbl.textColor = [UIColor blackColor];
        [view addSubview:lbl];
        [_bgview addSubview:view];
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, 0, 0.5, 80)];
        lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_bgview addSubview:lineView];
        x += 0.5+width;
        UIButton * btn = [[UIButton alloc]initWithFrame:view.bounds];
        btn.tag = i;
        [btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }
    
 
    
    
    
}
-(void)actionBtn:(UIButton*)btn{
    NSLog(@">>>%@",_array[btn.tag]);
    [_delegate titleStr:_array[btn.tag]];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
