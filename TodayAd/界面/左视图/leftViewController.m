//
//  leftViewController.m
//  TodayAd
//
//  Created by michan on 15/9/1.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "leftViewController.h"
#import "leftViewTableViewCell.h"
#import "MCbackButton.h"
#import "LoginUIViewController.h"
//#import "PPRevealSideViewController.h"
#import "RESideMenu.h"
@interface leftViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIButton *_myImage;
    UIButton *_dengRu;
    UIButton *_tongZhi;
    UIButton *_city;
    UIButton *_qianDao;
    UILabel *_qiaoxiLbl;
    UITableView *_tableView;
    NSArray * _titleArray;
    NSArray * _imgArray;

}
@end

@implementation leftViewController
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//
//    self.navigationController.navigationBarHidden=YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
   // self.view.backgroundColor = RGBCOLOR(254, 94, 101);
    _titleArray = @[@"我的订单",@"我的资源",@"关注",@"收藏",@"活动",@"联系我们"];
    _imgArray = @[@"order",@"Resources",@"attention",@"Collection",@"function",@"phone"];
    self.view.backgroundColor = [UIColor clearColor];
   // [self.navigationController.view addSubview:_bgView];
    [self prepareUI];
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 60)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor  =[UIColor clearColor];
    _tableView.tableHeaderView = [self headerView];
    _tableView.tableFooterView = [self fooerView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    
    
    MCbackButton * AdBtn = [[MCbackButton alloc]initWithFrame:CGRectMake(25, Main_Screen_Height - 60, 70, 20)];
    [AdBtn setImage:[UIImage imageNamed:@"car"] forState:0];
    [AdBtn setTitle:@"推广车" forState:0];
    AdBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [AdBtn setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:AdBtn];
    AdBtn.tag = 500;

    MCbackButton * setBtn = [[MCbackButton alloc]initWithFrame:CGRectMake(Main_Screen_Width - 110, Main_Screen_Height - 60, 50, 20)];
    setBtn.tag = 501;
    [setBtn setTitle:@"设置" forState:0];
    setBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [setBtn setTitleColor:[UIColor whiteColor] forState:0];
    [setBtn setImage:[UIImage imageNamed:@"setting"] forState:0];
    [self.view addSubview:setBtn];
}
-(UIView *)fooerView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 0.5)];
    view.backgroundColor =[UIColor whiteColor];
    return view;

}
-(UIView*)headerView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 180)];
    CGFloat x = Main_Screen_Width / 2;
    CGFloat y = 30;
    CGFloat width = 20;
    CGFloat height = 20;
    
    _tongZhi = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
    [_tongZhi setImage:[UIImage imageNamed:@"Notice"] forState:0];
    _tongZhi.tag = 401;
    [_tongZhi addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_tongZhi];

    x +=width + 10;
    width  = 20;
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    img.image = [UIImage imageNamed:@"location"];
    [view addSubview:img];
    x += 10;
    width = 40;
    _city = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
    _city.tag = 403;
    [_city setTitle:@"城市" forState:0];
    [_city addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];

    [_city setTitleColor:[UIColor whiteColor] forState:0];
    _city.titleLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:_city];

    x = 20;
    y = 90;
    width = 70;
    height  = 70;
    _myImage = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
    _myImage.tag = 402;
    [_myImage addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];

   // [_myImage setImage:[UIImage imageNamed:@"head"] forState:0];
    [_myImage setBackgroundImage:[UIImage imageNamed:@"head"] forState:0];
    ViewRadius(_myImage, 35);
    [view addSubview:_myImage];
    x += width + 10;
    y = 90;
    width = 70;
    height = 30;
    _dengRu = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
    [_dengRu setTitle:@"登陆" forState:0];
    
    _dengRu.tag = 400;
    [_dengRu addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_dengRu setTitleColor:[UIColor whiteColor] forState:0];
    _dengRu.titleLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:_dengRu];
    
    y += height + 5;
    width = 90;
    height = 25;
    UIView * qiandaoView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    qiandaoView.layer.borderColor = [UIColor whiteColor].CGColor;
    qiandaoView.layer.borderWidth = 0.5;
    [view addSubview:qiandaoView];
    img = [[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 15, 15)];
    img.image =[UIImage imageNamed:@"Sign"];
    [qiandaoView addSubview:img];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(35, 0, 50, 25)];
    lbl.text = @"签到";
    lbl.textColor = [UIColor whiteColor];
    lbl.textAlignment = NSTextAlignmentLeft;
    lbl.font = [UIFont systemFontOfSize:14];
    [qiandaoView addSubview:lbl];
    UIButton * btn = [[UIButton alloc]initWithFrame:qiandaoView.bounds];
    btn.tag = 405;
    [btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [qiandaoView addSubview:btn];
    
    x = 0;
    y  = _myImage.frame.origin.y + 70 + 20;
    width = Main_Screen_Width;
    height = 0.5;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    lineView.backgroundColor = [UIColor whiteColor];
    [view addSubview:lineView];
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"leftViewTableViewCell";
    leftViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"leftViewTableViewCell" owner:self options:nil]lastObject];
    cell.backgroundColor = [UIColor clearColor];
    cell.titielLbl.text = _titleArray[indexPath.row];
    cell.imgView.image  =[UIImage imageNamed:_imgArray[indexPath.row]];
    return cell;
}
-(void)actionBtn:(UIButton*)btn{
    
    [self.sideMenuViewController hideMenuViewController];

    //要传的值
    NSString *sendString;
    if (btn.tag == 400)
        sendString = @"登录";
    else if(btn.tag == 401)
        sendString = @"通知";
    else if(btn.tag == 402)
        sendString = @"我的资料";
    else if(btn.tag == 403)
        sendString = @"城市";
   
    else if(btn.tag == 405)
        sendString = @"签到";
    else if(btn.tag == 500)
        sendString = @"推广车";
    else if(btn.tag == 501)
        sendString = @"设置";


    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectObjNotification" object:sendString];

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
