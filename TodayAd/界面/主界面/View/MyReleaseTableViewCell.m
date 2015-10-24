//
//  MyReleaseTableViewCell.m
//  TodayAd
//
//  Created by michan on 15/9/6.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MyReleaseTableViewCell.h"

@interface MyReleaseTableViewCell (){
    
    UIImageView *_imgView_btn;
    UILabel *_titleLbl;
}

@end

@implementation MyReleaseTableViewCell
-(instancetype)init{
    
    self = [super init];
    if (self) {
        
        
        
    }
    return self;
 
    
}
-(void)prepareUI:(NSInteger)index{
    
    for (UIView* obj in self.contentView.subviews)
        [obj removeFromSuperview];
    CGRect  frame = self.contentView.frame;
    _imgView_btn = [[UIImageView alloc]initWithFrame:CGRectMake(frame.origin.x, 0, frame.size.width, frame.size.height - 30)];
    _imgView_btn.userInteractionEnabled = YES;
   // [_imgView_btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_imgView_btn];
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 55, frame.size.width, 30)];
    _titleLbl.textAlignment = NSTextAlignmentCenter;
    _titleLbl.font = [UIFont systemFontOfSize:14];
    _titleLbl.textColor = [UIColor grayColor];
    [self.contentView addSubview:_titleLbl];

}
-(void)setTitleStr:(NSString *)titleStr
{
    _titleLbl.text = titleStr;
}
-(void)setImgStr:(NSString *)imgStr{
    _imgView_btn.image = [UIImage imageNamed:imgStr];
}
//-(void)actionBtn:(UIButton*)btn{
//    if (_delegate) {
//        [_delegate setectBtn:btn.tag];
//    }
//}
@end
