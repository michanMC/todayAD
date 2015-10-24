//
//  MyReleaseViewController.m
//  TodayAd
//
//  Created by michan on 15/9/6.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MyReleaseViewController.h"
#import "MCIucencyView.h"
#import "MyRelease1TableViewCell.h"
#import "GerenViewController.h"
#import "huwaiViewController.h"
#import "zhizuoViewController.h"
#import "cehuaViewController.h"
#import "baozhiViewController.h"

@interface MyReleaseViewController ()<UITableViewDataSource,UITableViewDelegate,MyRelease1TableViewdetegate>
{
    UITableView *_tableView;
    NSArray * titleArray;
    NSArray * imgArray;


    
}

@end

@implementation MyReleaseViewController
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
    self.view.backgroundColor = [UIColor whiteColor];
    titleArray = @[
                   @[@"个人(自媒体)",@"需求"],
                   @[@"户外",@"LED",@"电视",@"网络"],
                   @[@"广播",@"新媒体",@"APP",@"杂志"],
                   @[@"策划",@"设备",@"材料",@"营销"],
                   @[@"新闻",@"报纸",@"制作"],
                   ];
    imgArray = @[
                 @[@"We-Media",@"Demand"],
                 @[@"outside",@"led",@"tv",@"internet"],
                 @[@"Radio",@"media",@"app",@"Magazine"],
                 @[@"idea",@"device",@"material",@"sale"],
                 @[@"news",@"paper",@"paper"],
                 ];

    self.title = @"我的发布";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat x = 0;
    CGFloat y = 64;
    CGFloat width = Main_Screen_Width;
    CGFloat height = Main_Screen_Height  - y;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];

    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100;
    }
    return 80;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"paper";
    MyRelease1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[MyRelease1TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imgArray = imgArray[indexPath.row];
    cell.delegate = self;
    if (indexPath.row == 0) {
        cell.titleArray = titleArray[indexPath.row];
        return cell;
    }
    cell.title2Array = titleArray[indexPath.row];
    return cell;
    
}
#pragma mark-点击
-(void)titleStr:(NSString *)title
{
    NSLog(@"---%@",title);
    if ([title isEqualToString:@"个人(自媒体)"]) {
        GerenViewController * ctl = [[GerenViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    else if([title isEqualToString:@"需求"])
    {
        
    }
    else if([title isEqualToString:@"制作"])
    {
        zhizuoViewController * ctl = [[zhizuoViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    else if([title isEqualToString:@"户外"])
    {
        huwaiViewController * ctl = [[huwaiViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    else if([title isEqualToString:@"LED"])
    {
        
    }
    else if([title isEqualToString:@"电视"])
    {
        
    }
    else if([title isEqualToString:@"网络"])
    {
        
    }else if([title isEqualToString:@"广播"])
    {
        
    }else if([title isEqualToString:@"新媒体"])
    {
        
    }else if([title isEqualToString:@"APP"])
    {
        
    }
    else if([title isEqualToString:@"杂志"])
    {
        
    }else if([title isEqualToString:@"策划"])
    {
        cehuaViewController * ctl = [[cehuaViewController alloc]init];
        [self pushNewViewController:ctl];

        
    }else if([title isEqualToString:@"设备"])
    {
        
    }else if([title isEqualToString:@"材料"])
    {
        
    }
    else if([title isEqualToString:@"营销"])
    {
        
    }else if([title isEqualToString:@"新闻"])
    {
        
    }else if([title isEqualToString:@"报纸"])
    {
        baozhiViewController * ctl = [[baozhiViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-分割线没有显示全，左边有一段缺失：
-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
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
