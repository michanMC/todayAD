//
//  RegisterViewController.m
//  TodayAd
//
//  Created by 123 on 15/9/18.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterTableViewCell.h"
#import "Register2ViewController.h"
@interface RegisterViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView * _tableView;
    NSString * _phoneStr;
    UIButton * _account1TypeBtn;
    UIButton * _account0TypeBtn;
    UIButton * seleBtn;
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ColorNavigation];
    self.title = @"注册";
    [self prepareUI];
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [self fooer];
    [self.view addSubview:_tableView];
}
-(UIView*)fooer{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton * nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 20,280, 40)];
    [nextBtn setTitle:@"下一步" forState:0];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:0];
    nextBtn.tag = 200;
    nextBtn.backgroundColor = AppCOLOR;
    ViewRadius(nextBtn, 5);
    [nextBtn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:nextBtn];
     seleBtn= [[UIButton alloc]initWithFrame:CGRectMake(20, 70, 20, 20)];
    [seleBtn setImage:[UIImage imageNamed:@"icon_checkbox1"] forState:0];
    seleBtn.tag = 201;
    [seleBtn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [seleBtn setImage:[UIImage imageNamed:@"icon_checkbox2"] forState:UIControlStateSelected];
    [view addSubview:seleBtn];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(25 + 20, 70, Main_Screen_Width - 45, 20)];
    lbl.text = @"同意今日大牌注册协议";
    lbl.textColor = [UIColor grayColor];
    lbl.font = [UIFont systemFontOfSize:15];
    [view addSubview:lbl];
    return view;
    
    
    
}
-(void)actionBtn:(UIButton*)btn{
    if (btn.tag == 201) {
        if (btn.selected) 
            btn.selected = NO;
        
        else
            btn.selected = YES;
    }
   else if (btn.tag == 200) {
       if (!_account0TypeBtn.selected && !_account1TypeBtn.selected) {
           kAlertMessage(@"请选择用户类型");
           return;

       }
       if (_phoneStr.length<1){
           kAlertMessage(@"请输入手机号码");
           return;
       }

       if (![CommonUtil isMobile:_phoneStr]){
           kAlertMessage(@"请正确输入手机号码");
       return;
       }
       if (!seleBtn.selected ) {
           kAlertMessage(@"请阅读协议");
           return;

       }
       Register2ViewController * ctl = [[Register2ViewController alloc]init];
       ctl.phoneStr = _phoneStr;
       if(_account0TypeBtn.selected)
           ctl.accountType = 0;
       else
           ctl.accountType = 1;

       [self pushNewViewController:ctl];
      // return;
       
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"RegisterTableViewCell";
    RegisterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"RegisterTableViewCell" owner:self options:nil]lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.phoneText.delegate = self;
    cell.phoneText.text = _phoneStr;
    cell.phoneText.keyboardType = UIKeyboardTypeNumberPad;
     _account0TypeBtn = cell.gerenBtn;
    _account1TypeBtn = cell.gongsiBtn;

    return cell;
    
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    _phoneStr = textField.text;
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
