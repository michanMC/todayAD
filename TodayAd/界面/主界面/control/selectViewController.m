//
//  selectViewController.m
//  TodayAd
//
//  Created by 颜吉超 on 15/9/16.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "selectViewController.h"

@interface selectViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_leftTbale;
    UITableView *_rightTbale;
    UIView *_contentView;
    NSArray *_leftArray;
    NSArray *_rightArray;
    NSInteger leftTag;//标记左边的tableview选中时的行数
}

@end

@implementation selectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精准筛选";
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"personage_n"] style:UIBarButtonItemStylePlain target:self action:@selector(showCityViewController)];
    _leftArray = @[@"电视",@"户外",@"个人",@"公司",@"广播",@"新媒体"];
    _rightArray = @[@[@"卫视1",@"央视1",@"省级",@"地方"],@[@"卫视2",@"央视2",@"省级",@"地方"],@[@"卫视3",@"央视3",@"省级",@"地方"],@[@"卫视4",@"央视4",@"省级",@"地方"],@[@"卫视5",@"央视5",@"省级",@"地方"],@[@"卫视6",@"央视6",@"省级",@"地方"]];
    _contentView = [[UIView alloc] init];
    _contentView.frame = CGRectMake(self.view.bounds.size.width, 0,self.view.bounds.size.width, self.view.bounds.size.height);
    _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _contentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_contentView];
    
    _leftTbale = [[UITableView alloc] init];
    _leftTbale.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height);
    _leftTbale.dataSource = self;
    _leftTbale.delegate = self;
    _leftTbale.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _leftTbale.showsVerticalScrollIndicator = NO;
    _leftTbale.tableFooterView = [[UIView alloc] init];
    [self.view insertSubview:_leftTbale belowSubview:_contentView];
    
    _rightTbale = [[UITableView alloc] init];
    _rightTbale.frame = CGRectMake(0, 64, _contentView.bounds.size.width, _contentView.bounds.size.height);
    _rightTbale.dataSource = self;
    _rightTbale.delegate = self;
    _rightTbale.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _rightTbale.showsVerticalScrollIndicator = NO;
    _rightTbale.tableFooterView = [[UIView alloc] init];
    [_contentView addSubview:_rightTbale];
}

-(void)showCityViewController{



}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTbale) {
        return 6;
    }else{
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTbale) {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.textLabel.text = _leftArray[indexPath.row];
        return cell;
    }else{
        static NSString *CellIdentifier2 = @"Cell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
        }
        cell.textLabel.text = _rightArray[leftTag][indexPath.row];
        return cell;
    }
}

#pragma mark - tableView 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    leftTag = indexPath.row;
    [_rightTbale reloadData];
    if (tableView == _leftTbale) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect viewContent = CGRectMake(self.view.center.x - 75, _contentView.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height);
            _contentView.frame = viewContent;
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
