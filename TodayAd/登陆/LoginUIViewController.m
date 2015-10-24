//
//  LoginUIViewController.m
//  TodayAd
//
//  Created by 123 on 15/9/18.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "LoginUIViewController.h"
#import "TextTableViewCell.h"
#import "RegisterViewController.h"
#import "ZhaohuiPwdViewController.h"
@interface LoginUIViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView * _tableView;
    NSString * _phone;
    NSString * _password;
    
}

@end

@implementation LoginUIViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self ColorNavigation];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height/2)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [self footer];
    _tableView.scrollEnabled = NO;
    
    [self.view addSubview:_tableView];
    
}
-(UIView*)footer{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 200)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton * loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(40, 30, Main_Screen_Width - 80,40 )];
    loginBtn.backgroundColor = AppCOLOR;
    ViewRadius(loginBtn, 5);
    [loginBtn setTitle:@"登录" forState:0];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:0];
    [view addSubview:loginBtn];
    loginBtn.tag = 100;
    [loginBtn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIButton * registerBtn = [[UIButton alloc]initWithFrame:CGRectMake((Main_Screen_Width - 80)/2, 90, 80, 25)];
    [registerBtn setTitleColor:[UIColor blackColor] forState:0];
    registerBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    registerBtn.tag = 101;
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [registerBtn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn setTitle:@"注册账号" forState:0];
    registerBtn.layer.borderColor = [UIColor grayColor].CGColor;
    registerBtn.layer.borderWidth = 1.0;
    [view addSubview:registerBtn];
    return view;
    
}
-(void)actionBtn:(UIButton*)btn{
    if (btn.tag == 100) {//登录
        [self textFieldDidEndEditing:nil];
        NSLog(@"%d",_password.length);
        if (_password.length < 6) {
            kAlertMessage(@"请输入足够位数的密码");
            return;
        }
        if (![CommonUtil isMobile:_phone]){
            kAlertMessage(@"请正确输入手机号码");
            return;
        }
        if ((_password.length >= 6)&&[CommonUtil isMobile:_phone]) {
            [self showLoading:YES AndText:nil];
            NSDictionary *parameters = @{@"phone":_phone,
                                         @"password":_password
                                        };
            
            [requestManager requestGETWebWithParaWithURL:@"/auth/login" Parameter:parameters Finish:^(NSDictionary *resultDic) {
                [self stopshowLoading];
                NSLog(@"登陆成功resultDic==%@",resultDic);
                [self showAllTextDialog:@"登陆成功"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                       [self.navigationController popViewControllerAnimated:YES];
                            });
                
            } Error:^(AFHTTPRequestOperation *operation, NSError *error, NSString *description) {
                [self showAllTextDialog:description];
                [self stopshowLoading];
            }];
            
              }
        
    }
    else if(btn.tag == 101){//注册
        RegisterViewController * ctl = [[RegisterViewController alloc]init];
        [self pushNewViewController:ctl];
        
    }
    else
    {
        ZhaohuiPwdViewController * ctl = [[ZhaohuiPwdViewController alloc]init];
        [self pushNewViewController:ctl];

        
        
    }
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
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"TextTableViewCell";
    TextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TextTableViewCell" owner:self options:nil]lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textFil.delegate = self;
    if (indexPath.row == 0) {
        cell.textFil.placeholder = @"电话";
        cell.imgView.image = [UIImage imageNamed:@"icon_phone"];
        cell.textFil.tag = 401;
        cell.textFil.delegate = self;

    }
    else if (indexPath.row == 1){
    cell.textFil.placeholder = @"输入密码";
    cell.imgView.image = [UIImage imageNamed:@"icon_pw"];
    cell.btn.hidden = NO;
    cell.textFil.tag = 402;
    cell.textFil.delegate = self;
    [cell.btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 401)
        _phone = textField.text;
    else if (textField.tag == 402)
        _password = textField.text;
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
