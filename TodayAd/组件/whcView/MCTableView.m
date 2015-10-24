//
//  MCTableView.m
//  TodayAd
//
//  Created by 123 on 15/9/16.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MCTableView.h"

@implementation MCTableView
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        [self reloadData];
        
    }
    
    return self;
}
#pragma mark - TableViewDelegate & TableViewDatasource

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (tableView == self) {
//        return JXSpellFromIndex(section);
//        
//    }
//    else{
//        return nil;
//    }
//    
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  * strCell = @"strCell1";
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strCell];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"自定义";
    return cell;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
