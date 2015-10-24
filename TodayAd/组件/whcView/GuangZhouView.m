//
//  GuangZhouView.m
//  TodayAd
//
//  Created by 123 on 15/9/16.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "GuangZhouView.h"
#import "recom1TableViewCell.h"
@implementation GuangZhouView
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
       // self.tableHeaderView = [self headView];
        
        
    }
    
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid1 = @"cellid1";
    recom1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid1];
    if (!cell) {
        cell = [[recom1TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid1];
    }
    cell.headTitle = @"无锡崇安区解放东路保利广场LED大屏";
    cell.subTitle = @"北京东方品牌文化传媒有限公司";
    cell.isHot = NO;
    cell.hotImgStr = @"hot";
    cell.liulanStr = @"180";
    cell.phoneStr = @"20";
    cell.timeStr = @"5分钟";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
