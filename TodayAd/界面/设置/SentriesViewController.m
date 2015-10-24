//
//  SentriesViewController.m
//  TodayAd
//
//  Created by MC on 15/10/17.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "SentriesViewController.h"
#import "SentriesTableViewCell.h"
@interface SentriesViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray * _titleArray;
    BOOL isWuTu;
    BOOL istuisong;
    BOOL iszhuangfa;
}

@end

@implementation SentriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    _titleArray = @[
                    @[@"字体大小",@"无图模式"],
                    @[@"推送通知",@"收藏时转发"],
                    @[@"清理缓存",@"检查新版本",@"精彩应用推荐",@"使用帮助"]
                    ];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
        return 4;
    return 2;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"SentriesTableViewCell";
    SentriesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SentriesTableViewCell" owner:self options:nil]lastObject];
    cell.titleLbl.text = _titleArray[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0 && indexPath.row == 1) {
        cell.btn.hidden = NO;
        cell.btn.selected = isWuTu;
        cell.btn.tag = 300;
        [cell.btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(indexPath.section == 1){
        cell.btn.hidden = NO;
        if (indexPath.row == 0) {
            cell.btn.selected = istuisong;
            cell.btn.tag = 301;

        }
        else{
        cell.btn.selected = iszhuangfa;
        cell.btn.tag = 302;
        }
        [cell.btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(indexPath.section == 2 && indexPath.row == 0){
        cell.title2Lbl.hidden = NO;
        cell.title2Lbl.text = @"22M";
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    return cell;
    
}
-(void)actionBtn:(UIButton*)btn{
    if (btn.tag == 300) {//无图
        if (isWuTu)
            isWuTu = NO;
        else
            isWuTu = YES;
        
    }
    else if(btn.tag == 301){//推送
        if (istuisong)
            istuisong = NO;
        else
            istuisong = YES;
  
    } else if(btn.tag == 302){//转发
        if (iszhuangfa)
            iszhuangfa = NO;
        else
            iszhuangfa = YES;
        
    }
    [_tableView reloadData];


    
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
