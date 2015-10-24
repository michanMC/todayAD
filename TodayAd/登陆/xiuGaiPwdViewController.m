//
//  xiuGaiPwdViewController.m
//  TodayAd
//
//  Created by air on 15/9/30.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "xiuGaiPwdViewController.h"
#import "TextTableViewCell.h"
@interface xiuGaiPwdViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
    NSString * _pwd1Str;
    NSString * _pwd2Str;
    
}

@end

@implementation xiuGaiPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ColorNavigation];
    self.title = @"重置密码";
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource= self;
    _tableView.tableHeaderView = [self headView];
    _tableView.tableFooterView = [self fooer];
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}
-(UIView*)headView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 150)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIImageView * headimgView = [[UIImageView alloc]initWithFrame:CGRectMake((Main_Screen_Width - 50)/2, (150 - 50)/2, 50, 50)];
    headimgView.image = [UIImage imageNamed:@"头像"];
    [view addSubview:headimgView];
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, headimgView.frame.origin.y + 50 + 10, Main_Screen_Width, 20)];
    nameLbl.text =_phoneStr;
    nameLbl.textAlignment = NSTextAlignmentCenter;
    nameLbl.font = [UIFont systemFontOfSize:13];
    [view addSubview:nameLbl];
    return view;
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
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 600)
        _pwd1Str = textField.text;
    
    else if (textField.tag == 601)
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
    return 2;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"TextTableViewCell";
    TextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TextTableViewCell" owner:self options:nil]lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textFil.tag = 600 + indexPath.row;
           cell.regBtn.hidden = YES;
        cell.textFil.secureTextEntry = YES;
       cell.textFil.delegate = self;
    cell.imgView.image = [UIImage imageNamed:@"icon_pw"];
    if (indexPath.row == 0) {
        cell.textFil.placeholder = @"输入新密码";
        cell.textFil.text = _pwd1Str;
    }
    else if(indexPath.row == 1){
         cell.textFil.placeholder = @"再次输入新密码";
        cell.textFil.text = _pwd2Str;
    }
    return cell;
}

-(void)okBtn{
    if (_pwd1Str.length < 6) {
        kAlertMessage(@"请输入6位数的密码");
        return;
    }
    if(![_pwd1Str isEqualToString:_pwd1Str]){
        kAlertMessage(@"两次密码不一致");
        return;
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
