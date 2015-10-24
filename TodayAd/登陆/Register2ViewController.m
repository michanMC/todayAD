//
//  Register2ViewController.m
//  TodayAd
//
//  Created by 123 on 15/9/18.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "Register2ViewController.h"
#import "TextTableViewCell.h"
#import "LoginUIViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"
#import "MCNavViewController.h"
#import "leftViewController.h"
#import "RESideMenu.h"
@interface Register2ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,RESideMenuDelegate>
{
    UITableView * _tableView;
    NSArray * _imgArray;
    NSArray * _placeArray;
    UIButton * _registerBtn;
    NSTimer *_gameTimer;
    NSDate   *_gameStartTime;
    NSString *_verifyStr;
    NSString * _pwd1Str;
    NSString * _pwd2Str;
    NSString *code;//校准验证码
}

@end

@implementation Register2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ColorNavigation];
    self.title = @"注册";
    _imgArray = @[@"icon_yanzhengma",@"icon_pw",@"icon_pw"];
    _placeArray = @[@"验证码",@"输入密码",@"确认密码"];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource= self;
    _tableView.tableFooterView = [self fooer];
    [self.view addSubview:_tableView];
}
-(UIView *)fooer{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton * OKBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 20, Main_Screen_Width - 80, 40)];
    OKBtn.backgroundColor = AppCOLOR;
    [OKBtn setTitle:@"完成" forState:0];
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
    if (_pwd1Str.length < 6) {
        kAlertMessage(@"请输入6位数的密码");
        return;
    }
    if(![_pwd1Str isEqualToString:_pwd1Str]){
        kAlertMessage(@"两次密码不一致");
        return;
    }
          [self showLoading:YES AndText:nil];
        NSDictionary *parameters = @{@"phone":_phoneStr,
                                     @"accountType":@(_accountType),
                                     @"password":_pwd1Str,
                                     @"code":_verifyStr};
        [requestManager requestGETWebWithParaWithURL:@"/auth/register" Parameter:parameters Finish:^(NSDictionary *resultDic) {
            [self stopshowLoading];
            NSLog(@"成功resultDic==%@",resultDic);
            [self showAllTextDialog:@"注册成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                //进入首页
                HomeViewController *main = [[HomeViewController alloc] init];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
                leftViewController *leftMenuViewController = [[leftViewController alloc] init];
                RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:nav
                                                                                leftMenuViewController:leftMenuViewController
                                                                               rightMenuViewController:nil];
                sideMenuViewController.backgroundImage = [UIImage imageNamed:@"bg1"];
                sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
                sideMenuViewController.delegate = self;
                sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
                sideMenuViewController.scaleMenuView = YES;
                sideMenuViewController.panGestureEnabled = YES;
                sideMenuViewController.contentViewShadowRadius = 12;
                sideMenuViewController.contentViewShadowEnabled = YES;
                AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                appDelegate.window.rootViewController = sideMenuViewController;
                
                
                
                
                
                //[self.navigationController popViewControllerAnimated:YES];
            });
            
        } Error:^(AFHTTPRequestOperation *operation, NSError *error, NSString *description) {
            [self showAllTextDialog:description];
            [self stopshowLoading];
        }];
     
    
    NSLog(@"%@",_verifyStr);
    NSLog(@"%@",_pwd1Str);
    NSLog(@"%@",_pwd2Str);
    NSLog(@"%d",_accountType);
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 300)
        _verifyStr = textField.text;
   else if (textField.tag == 301)
        _pwd1Str = textField.text;

   else if (textField.tag == 302)
        _pwd2Str = textField.text;
    
    [_tableView reloadData];

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"TextTableViewCell";
    TextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TextTableViewCell" owner:self options:nil]lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textFil.tag = 300 + indexPath.row;
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
    if (indexPath.row == 1) {
        cell.textFil.text = _pwd1Str;
    }
    else if(indexPath.row == 2){
        cell.textFil.text = _pwd2Str;
    }
    return cell;
}
#pragma mark-获取验证码
-(void)regis{
    _gameStartTime=[NSDate date];
    //风火轮动画
    [self showLoading:YES AndText:nil];
    
    NSDictionary *parameters = @{
                                 @"phone":_phoneStr
                                 };
    [requestManager requestGETWebWithParaWithURL:@"/auth/register/genCode" Parameter:parameters Finish:^(NSDictionary *resultDic) {
        [self stopshowLoading];
        [self showAllTextDialog:@"发送成功,请留意手机短信"];
        _gameTimer= [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];

        
    } Error:^(AFHTTPRequestOperation *operation, NSError *error, NSString *description) {
        [self showAllTextDialog:description];
        [self stopshowLoading];
    }];

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
