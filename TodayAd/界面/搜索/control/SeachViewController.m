//
//  SeachViewController.m
//  TodayAd
//
//  Created by michan on 15/9/6.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "SeachViewController.h"
#import "SeachListViewController.h"
#import "PopoverView.h"
#import "Seach1TableViewCell.h"
#import "Seach2TableViewCell.h"

@interface SeachViewController ()<UITableViewDataSource,UITableViewDelegate,Seach1TableViewCellDelegate>{
    UIView *_nagView;
    UILabel *_selectLbl;
    UITableView * _tableView;
    NSArray * _tilteArray;
}

@end

@implementation SeachViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _nagView.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _nagView.hidden  =YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tilteArray = @[@"户外",@"LED",@"报纸",@"创新",@"大牌秀",@"XX公司",@"营销",@"活动公司",@"广告材料"];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _nagView = [[UIView alloc]initWithFrame:CGRectMake(50, 0, Main_Screen_Width - 50, 44)];
    _nagView.userInteractionEnabled = YES;
   // _nagView.backgroundColor = [UIColor yellowColor];
    [self.navigationController.navigationBar addSubview:_nagView];
    _selectLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 44)];
    _selectLbl.text = @"资源";
    //_selectLbl.backgroundColor = [ UIColor redColor];
    _selectLbl.font = [UIFont systemFontOfSize:14];
    [_nagView addSubview:_selectLbl];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(32, 10, 24, 24)];
    [btn setImage:[UIImage imageNamed:@"list_arrow_normal"] forState:0];
    [btn addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [_nagView addSubview:btn];
    UITextField *txt = [[UITextField alloc]initWithFrame:CGRectMake(60, 10, _nagView.frame.size.width - 15 - 60, 24)];
   // ViewRadius(txt, 10);
    txt.font  =[UIFont systemFontOfSize:14];
    [_nagView addSubview:txt];
    txt.enabled  =NO;
    txt.borderStyle = UITextBorderStyleRoundedRect;
    txt.placeholder = @"搜索感兴趣的内容";
     btn = [[UIButton alloc]initWithFrame:txt.frame];
    [btn addTarget:self action:@selector(actionText) forControlEvents:UIControlEventTouchUpInside];
    [_nagView addSubview:btn];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate  =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    return 3 * 25 + 4 * 10 + 10;
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return @"  热门搜索";
    
    return @"  猜你喜欢";
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid1 = @"Seach1TableViewCell";
    static NSString * cellid2 = @"Seach2TableViewCell";

    if (indexPath.section == 0) {
        
    Seach1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid1];
    if (!cell) {
        cell = [[Seach1TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid1]
        ;
    }
    cell.delegate  =self;
    cell.tilteArray = _tilteArray;
    
    return cell;
    }
    else{
    Seach2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"Seach2TableViewCell" owner:self options:nil]lastObject];        ;
    }
#warning 测试
    cell.titleLbl.text  = @"灯箱";
    cell.title2Lbl.text = @"灯箱制作";
    return cell;
    }

    
}
-(void)button2Clicked:(UIButton *)sender
{
    CGPoint point = CGPointMake(sender.frame.origin.x + sender.frame.size.width/2 + 20, sender.frame.origin.y + sender.frame.size.height + 20);
    NSArray *titles = @[@"资源", @"公司"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:nil];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%ld", (long)index);
        _selectLbl.text =titles[index];
    };
    [pop show];
}


-(void)actionBtn:(UIButton *)btn
{
    SeachListViewController * ctl = [[SeachListViewController alloc]init];
    [self pushNewViewController:ctl];
}
-(void)actionText{
    SeachListViewController * ctl = [[SeachListViewController alloc]init];
    [self pushNewViewController:ctl];
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
