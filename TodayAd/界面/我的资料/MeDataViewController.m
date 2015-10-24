//
//  MeDataViewController.m
//  TodayAd
//
//  Created by 123 on 15/9/19.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MeDataViewController.h"
#import "MeData1TableViewCell.h"
#import "UIPlaceHolderTextView.h"
#import "MeData2TableViewCell.h"
#import "SexViewController.h"
@interface MeDataViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,SexViewControllerdelegate,UITextFieldDelegate>
{
    UITableView*_tableView;
    UIImageView *_headImgView;
    UILabel * _walletLbl;
    UIView * _bgView;
    NSString * _signatureStr;
    UIPlaceHolderTextView * _textView;
    NSString *_nameStr;
    NSString * _sexStr;
    NSString * _phoneStr;
    NSString *_addressStr;

    
}

@end

@implementation MeDataViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self ColorNavigation];
    _bgView.hidden = NO;

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[self appColorNavigation];
    _bgView.hidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的资料";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];//[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(showrightViewController)];

    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 63, Main_Screen_Width, Main_Screen_Height - 63)];
    _bgView.backgroundColor = RGBCOLOR(235, 78, 52);//[UIColor groupTableViewBackgroundColor];
    [self.navigationController.view addSubview:_bgView];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, _bgView.frame.size.height) style:UITableViewStyleGrouped];
   // _tableView.backgroundColor = [UIColor]
    _tableView.delegate  =self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [self headView];
    [_bgView addSubview:_tableView];

    // Do any additional setup after loading the view.
}
-(UIView*)headView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 150)];
    view.backgroundColor = RGBCOLOR(235, 78, 52);
    _headImgView = [[UIImageView alloc]initWithFrame:CGRectMake((Main_Screen_Width - 80) / 2, 20, 80, 80)];
    _headImgView.image = [UIImage imageNamed:@"头像"];
    ViewRadius(_headImgView, 40);
    [view addSubview:_headImgView];
    _walletLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, Main_Screen_Width - 20, 20)];
    _walletLbl.textAlignment = NSTextAlignmentRight;
    _walletLbl.text = @"￥300.00";
    _walletLbl.textColor = [UIColor whiteColor];
    [view addSubview:_walletLbl];
    return view;
}
-(void)save{
    NSLog(@"%@",_nameStr);
    NSLog(@"%@",_sexStr);
    NSLog(@"%@",_phoneStr);
    NSLog(@"%@",_addressStr);
    NSLog(@"%@",_signatureStr);

    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 500)
        _nameStr = textField.text;
    if (textField.tag == 501)
        _sexStr = textField.text;
    if (textField.tag == 502)
        _phoneStr = textField.text;
    if (textField.tag == 503)
        _addressStr = textField.text;

    [_tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2)
        return 1;
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 110;
    }
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"MeData1TableViewCell";
    static NSString * cellid2 = @"MeData2TableViewCell";
    if (indexPath.section != 2) {
        
    MeData1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MeData1TableViewCell" owner:self options:nil]lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textfil.delegate = self;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
          cell.titleLbl.text = @"姓名";
            cell.textfil.text = _nameStr;
            cell.textfil.placeholder = @"请输入姓名";
            cell.textfil.tag = 500;
        }
        else
        {
          cell.titleLbl.text = @"性别";
            cell.textfil.tag = 501;
            cell.textfil.text = _sexStr;
            cell.textfil.userInteractionEnabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.titleLbl.text = @"电话";
            cell.textfil.tag = 502;
            cell.textfil.placeholder = @"请输入电话号码";

            cell.textfil.text = _phoneStr;

            cell.textfil.keyboardType = UIKeyboardTypeNumberPad;
        }
        else
        {
            cell.textfil.text = _addressStr;
            cell.textfil.tag = 503;
            cell.textfil.placeholder = @"请输入地址";

            cell.titleLbl.text = @"地址";
            
        }

    }
    return cell;
    }
    else
    {
        MeData2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
        if (!cell) {
            cell = [[MeData2TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid2];
        }
        _textView = cell.textView;
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.text = _signatureStr;
        _textView.delegate = self;
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            SexViewController * ctl = [[SexViewController alloc]init];
            ctl.delegate =self;
            [self pushNewViewController:ctl];
        }
    }
}
-(void)backMsg:(NSString *)msg
{
    _sexStr = msg;
    [_tableView reloadData];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"%d",_textView.text.length);
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        _signatureStr = textView.text;
        [_textView resignFirstResponder];
        [_tableView reloadData];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    _signatureStr = textView.text;
    [_textView resignFirstResponder];
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
