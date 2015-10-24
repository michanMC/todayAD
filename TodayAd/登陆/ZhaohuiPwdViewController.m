//
//  ZhaohuiPwdViewController.m
//  TodayAd
//
//  Created by air on 15/9/30.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "ZhaohuiPwdViewController.h"
#import "TextTableViewCell.h"
#import "xiuGaiPwdViewController.h"
@interface ZhaohuiPwdViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>{
    
     UITableView * _tableView;
    UIButton * _registerBtn;
    NSTimer *_gameTimer;
    NSDate   *_gameStartTime;
    NSString *_verifyStr;
    NSString * _phoneStr;
    NSArray * _imgArray;
    NSArray * _placeArray;
}

@end

@implementation ZhaohuiPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ColorNavigation];
    self.title =  @"找回密码";
    _imgArray = @[@"icon_phone",@"icon_yanzhengma"];
    _placeArray = @[@"输入手机号码",@"输入验证码"];

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource= self;
    _tableView.tableFooterView = [self fooer];
    [self.view addSubview:_tableView];

    // Do any additional setup after loading the view.
}
-(UIView *)fooer{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton * OKBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 20, Main_Screen_Width - 80, 40)];
    OKBtn.backgroundColor = AppCOLOR;
    [OKBtn setTitle:@"提交" forState:0];
    [OKBtn setTitleColor:[UIColor whiteColor] forState:0];
    OKBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    ViewRadius(OKBtn, 5);
    [OKBtn addTarget:self action:@selector(okBtn) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:OKBtn];
    // view.backgroundColor = [UIColor redColor];
    return view;
}
#pragma mark-完成Btn
-(void)okBtn{
    if (_verifyStr.length < 1) {
        kAlertMessage(@"请输入验证码");
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

    xiuGaiPwdViewController * ctl = [[xiuGaiPwdViewController alloc]init];
    ctl.phoneStr = _phoneStr;
    [self.navigationController pushViewController:ctl animated:YES];
    
    

}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 500)
        _phoneStr = textField.text;
    else if (textField.tag == 501)
        _verifyStr = textField.text;
    
      
    [_tableView reloadData];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"TextTableViewCell";
    TextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TextTableViewCell" owner:self options:nil]lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textFil.tag = 500 + indexPath.row;
    if (indexPath.row == 0) {
        cell.regBtn.hidden = NO;
        ViewRadius(cell.regBtn, 5);
        _registerBtn = cell.regBtn;
        [_registerBtn addTarget:self action:@selector(regis) forControlEvents:UIControlEventTouchUpInside];
        cell.textFil.text = _verifyStr;
    }
    else{
        cell.regBtn.hidden = YES;
        cell.textFil.secureTextEntry = YES;
    }
    cell.imgView.image = [UIImage imageNamed:_imgArray[indexPath.row]];
    cell.textFil.placeholder = _placeArray[indexPath.row];
    cell.textFil.delegate = self;
    if (indexPath.row == 0) {
        cell.textFil.text = _phoneStr;
    }
    else if(indexPath.row == 1){
        cell.textFil.text = _verifyStr;
    }
    return cell;
}
#pragma mark-获取验证码
-(void)regis{
    
    if (_phoneStr.length<1){
        kAlertMessage(@"请输入手机号码");
        return;
    }
    
    if (![CommonUtil isMobile:_phoneStr]){
        kAlertMessage(@"请正确输入手机号码");
        return;
    }

    _gameStartTime=[NSDate date];
    _gameTimer= [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    
    
}
// 时钟触发执行的方法
- (void)updateTimer:(NSTimer *)sender
{
    
    NSInteger deltaTime = [sender.fireDate timeIntervalSinceDate:_gameStartTime];
    
    NSString *text = [NSString stringWithFormat:@"%ld",60 - deltaTime];
    
    if (deltaTime==60) {
        [_registerBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        [_registerBtn setUserInteractionEnabled:YES];
        [_gameTimer invalidate];
        return;
    }else
    {
        [_registerBtn setTitle:text forState:UIControlStateNormal];
        [_registerBtn setUserInteractionEnabled:NO];
        
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
