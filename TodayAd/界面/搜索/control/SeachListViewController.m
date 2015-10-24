//
//  SeachListViewController.m
//  TodayAd
//
//  Created by michan on 15/9/6.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "SeachListViewController.h"

@interface SeachListViewController ()<UITextFieldDelegate>{
    UIView *_nagView;
    UITextField *_textField;

}

@end

@implementation SeachListViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _nagView.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_textField resignFirstResponder];

    _nagView.hidden  =YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _nagView = [[UIView alloc]initWithFrame:CGRectMake(50, 0, Main_Screen_Width - 50, 44)];
    _nagView.userInteractionEnabled = YES;
     //_nagView.backgroundColor = [UIColor yellowColor];
    [self.navigationController.navigationBar addSubview:_nagView];
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 10, _nagView.frame.size.width - 15 - 50, 24)];
    // ViewRadius(txt, 10);
    _textField.delegate = self;
    _textField.font  =[UIFont systemFontOfSize:14];
    [_nagView addSubview:_textField];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.placeholder = @"请输入关键字";
    [_textField becomeFirstResponder];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(_nagView.frame.size.width - 55, 12, 40, 20)];
    [btn setTitle:@"取消" forState:0];
    [btn setTitleColor:[UIColor grayColor] forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(canBtn) forControlEvents:UIControlEventTouchUpInside];
    [_nagView addSubview:btn];
    
   }
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
   // NSLog(@"搜索>>%@",textField.text);
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"搜索>>%@",textField.text);
 
}
-(void)canBtn{
    [_textField resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
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
