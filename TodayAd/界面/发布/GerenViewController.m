//
//  GerenViewController.m
//  TodayAd
//
//  Created by air on 15/10/1.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "GerenViewController.h"
#import "GerenTableViewCell.h"
@interface GerenViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    
    UITableView *_tableView;
    NSArray * _imgarray;
    NSArray * _lblarray;

}

@end

@implementation GerenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self whiteColorNavigation];
    self.title = @"个人(自媒体)";
    _imgarray = @[
                  @[@"weixin",@"QQ",@"pengyouquan"],
                  @[@"weibo",@"tengxunweibo",@"weibo"],
                  @[@"other",@"",@""],
                  ];
    _lblarray = @[
                  @[@"微信群",@"QQ群",@"朋友圈"],
                  @[@"新浪微博",@"腾讯微博",@"订阅"],
                  @[@"其他",@"",@""],
                  ];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"GerenTableViewCell";
    GerenTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
        cell = [[[NSBundle mainBundle]loadNibNamed:@"GerenTableViewCell" owner:self options:nil]lastObject];
    cell.imgview1 .image = [UIImage imageNamed:_imgarray[indexPath.row][0]];
    cell.imgview2 .image = [UIImage imageNamed:_imgarray[indexPath.row][1]];
    cell.imgview3 .image = [UIImage imageNamed:_imgarray[indexPath.row][2]];
    cell.lbl1.text = _lblarray[indexPath.row][0];
    cell.lbl2.text = _lblarray[indexPath.row][1];
    cell.lbl3.text = _lblarray[indexPath.row][2];
   cell.btn1.titleLabel.text =_lblarray[indexPath.row][0];
    cell.btn2.titleLabel.text =_lblarray[indexPath.row][1];
    cell.btn3.titleLabel.text =_lblarray[indexPath.row][2];

    [cell.btn1 addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btn2 addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btn3 addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];

    return cell;

    
}
-(void)actionBtn:(UIButton*)btn{
    
    if ([btn.titleLabel.text isEqualToString:@"微信群"]) {
        NSLog(@"微信");
    }
    else if([btn.titleLabel.text isEqualToString:@"QQ群"]){
        NSLog(@"QQ");
    } else if([btn.titleLabel.text isEqualToString:@"朋友圈"]){
        NSLog(@"朋友");
    } else if([btn.titleLabel.text isEqualToString:@"新浪微博"]){
        NSLog(@"新浪");
    } else if([btn.titleLabel.text isEqualToString:@"腾讯微博"]){
        NSLog(@"腾讯");
    } else if([btn.titleLabel.text isEqualToString:@"订阅"]){
        NSLog(@"订阅");
    } else if([btn.titleLabel.text isEqualToString:@"其他"]){
        NSLog(@"其他");
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
