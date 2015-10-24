//
//  ScreenViewController.m
//  TodayAd
//
//  Created by michan on 15/9/14.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "ScreenViewController.h"
#import "LeftScreenTableViewCell.h"
#import "rightScreenTableViewCell.h"
@interface ScreenViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    UITableView *_leftTable;
    UITableView *_rightTable;
    NSArray * _leftArray;
    NSMutableArray * _rightArray;
    BOOL _isfirst;
    
}

@end

@implementation ScreenViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
       self.navigationController.navigationBar.barTintColor =       AppCOLOR;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor whiteColor], NSForegroundColorAttributeName,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:40.0], NSFontAttributeName,
                                                                     nil]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精确筛选";
    _isfirst = YES;
    _leftArray = @[@"电视",@"户外",@"个人",@"公司",@"广播",@"新媒体"];
    _rightArray =  [[NSMutableArray alloc]initWithObjects:@"卫视",@"央视",@"省级",@"地方", nil];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"gps"] style:UIBarButtonItemStylePlain target:self action:@selector(showrightViewController)];
    _leftTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 80, Main_Screen_Height - 64)];
    _leftTable.delegate = self;
    _leftTable.dataSource = self;
    _leftTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _leftTable.backgroundColor  =[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_leftTable];
    _rightTable = [[UITableView alloc]initWithFrame:CGRectMake(80, 64, Main_Screen_Width - 80, Main_Screen_Height - 64)];
    _rightTable.delegate = self;
    _rightTable.dataSource = self;
    _rightTable.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_rightTable];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTable)
        return _leftArray.count;
    return _rightArray.count;

    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid1 = @"LeftScreenTableViewCell";
    static NSString * cellid2 = @"rightScreenTableViewCell";
    if (tableView == _leftTable) {
        LeftScreenTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid1];
        if (!cell)
            cell = [[[NSBundle mainBundle]loadNibNamed:@"LeftScreenTableViewCell" owner:self options:nil]lastObject];
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        cell.tilieLbl.text  = _leftArray[indexPath.row];
        if (_isfirst && indexPath.row == 0) {
            cell.bgView.backgroundColor = [UIColor whiteColor];
            cell.imgView.hidden = NO;
            _isfirst = NO;
        }
        return cell;
    }
    rightScreenTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"rightScreenTableViewCell" owner:self options:nil]lastObject];
    cell.tileLbl.text  = _rightArray[indexPath.row];
    return cell;


    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTable) {
        LeftScreenTableViewCell * cell = (LeftScreenTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        cell.bgView.backgroundColor = [UIColor whiteColor];
        cell.imgView.hidden = NO;
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
#warning 测试
        [_rightArray addObject:[NSString stringWithFormat:@"测试%ld",indexPath.row]];
        [_rightTable reloadData];
        if (![indexPath isEqual:index]) {

        LeftScreenTableViewCell * cell1 = (LeftScreenTableViewCell*)[tableView cellForRowAtIndexPath:index];
        cell1.bgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell1.imgView.hidden = YES;
        }

    }
    else
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        NSLog(@">>>%@",_rightArray[indexPath.row]);
    }
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTable) {
        LeftScreenTableViewCell * cell = (LeftScreenTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        
        cell.bgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell.imgView.hidden = YES;
        
    }

}
-(void)showrightViewController{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-分割线没有显示全，左边有一段缺失：
-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if ([_leftTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [_leftTable setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_leftTable respondsToSelector:@selector(setLayoutMargins:)])  {
        [_leftTable setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([_rightTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [_rightTable setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_rightTable respondsToSelector:@selector(setLayoutMargins:)])  {
        [_rightTable setLayoutMargins:UIEdgeInsetsZero];
    }

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
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
