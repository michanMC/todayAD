//
//  RecommendViewController.m
//  TodayAd
//
//  Created by michan on 15/9/1.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "RecommendViewController.h"
#import "recom1TableViewCell.h"
#import "recom2TableViewCell.h"
#import "recom3TableViewCell.h"

@interface RecommendViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView * _scrollView;
    UIPageControl * pageControl;
    UITableView *_tableView;

}

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, self.view.frame.size.height - 44 - 40 - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = [self headView];

    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //先固定3个不同类型的cell
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    return 100;
    return 120;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString * cellid1 = @"cellid1";
    static NSString * cellid2 = @"cellid2";
    static NSString * cellid3 = @"cellid3";
    if (indexPath.row == 0) {
    recom1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid1];
    if (!cell) {
        cell = [[recom1TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid1];
    }
    cell.headTitle = @"无锡崇安区解放东路保利广场LED大屏";
    cell.subTitle = @"北京东方品牌文化传媒有限公司";
    cell.isHot = NO;
    cell.liulanStr = @"180";
    cell.phoneStr = @"20";
    cell.timeStr = @"5分钟";
    return cell;
    }else if(indexPath.row ==1){
        recom2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
        if (!cell) {
            cell = [[recom2TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid2];
        }
        cell.headTitle = @"无锡崇安区解放东路保利广场LED大屏";
        cell.isHot = NO;
        cell.liulanStr = @"180";
        cell.phoneStr = @"20";
        cell.timeStr = @"5分钟";
        return cell;

    }
    if (indexPath.row == 2) {
        recom3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
        if (!cell) {
            cell = [[recom3TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid3];
        }
        cell.headTitle = @"无锡崇安区解放东路保利广场LED大屏";
        cell.isHot = NO;
        cell.liulanStr = @"180";
        cell.phoneStr = @"20";
        cell.timeStr = @"5分钟";
        return cell;
 
    }
    return [[UITableViewCell alloc]init];
}
#pragma mark - 广告头
-(UIView*)headView{
    
    NSMutableArray * imageArray = [NSMutableArray arrayWithObjects:@"banner05",@"banner01",@"banner02",@"banner03",@"banner04",@"banner05",@"banner01", nil];//
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 140)];
    CGFloat x = 0;
    CGFloat  y = 0;
    CGFloat width = Main_Screen_Width;
    CGFloat height = 140;
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [view addSubview:_scrollView];
    x = 0;
    y = 0;
    _scrollView.contentOffset = CGPointMake(Main_Screen_Width, 0);
    
    for (int index = 0; index < imageArray.count; index++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        imageView.image = [UIImage imageNamed:imageArray[index]];
        imageView.userInteractionEnabled = YES;
//        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHead)];
//        [imageView addGestureRecognizer:tap];
        imageView.tag = index;
        
        x += width;
        [_scrollView addSubview:imageView];
        
    }
    _scrollView.contentSize = CGSizeMake(x, 0);
    width = width /6 ;
    x = (Main_Screen_Width - width ) / 2;
    
    height = 20;
    y = 140 - 20;
    pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, y, width, height)];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor =AppCOLOR;
    pageControl.numberOfPages = 5;
    [view addSubview:pageControl];
    //NSTimer * timer = [[NSTimer alloc]init];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    
    return view;
}
#pragma mark -scrollView代理
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat page = _scrollView.contentOffset.x;
    if (page <= 0) {
        page = 5 * _scrollView.frame.size.width;
        _scrollView.contentOffset = CGPointMake(page, 0);
    }
    else if(page >= 6 * _scrollView.frame.size.width){
        page = Main_Screen_Width;
        _scrollView.contentOffset = CGPointMake(page, 0);
        
    }
    CGFloat curPage =  _scrollView.contentOffset.x / _scrollView.frame.size.width - 1;
    
    pageControl.currentPage = (NSInteger)curPage;
}
#pragma mark-广告头自动滑动
-(void)autoScroll{
    CGFloat page = _scrollView.contentOffset.x / Main_Screen_Width;
    if (page < 5) {
        [UIView animateWithDuration:1.0 animations:^{
            _scrollView.contentOffset = CGPointMake((page + 1)* Main_Screen_Width, 0);
        } completion:^(BOOL finished) {
            pageControl.currentPage = (NSInteger)page;
        }];
    }
    else{
        [UIView animateWithDuration:(1.0) animations:^{
            _scrollView.contentOffset = CGPointMake((page + 1)* Main_Screen_Width, 0);
        } completion:^(BOOL finished) {
            pageControl.currentPage = 0;
            _scrollView.contentOffset = CGPointMake(Main_Screen_Width, 0);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
