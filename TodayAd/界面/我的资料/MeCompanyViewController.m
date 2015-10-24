//
//  MeCompanyViewController.m
//  TodayAd
//
//  Created by 123 on 15/9/19.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MeCompanyViewController.h"
#import "UIPlaceHolderTextView.h"
#import "MeData1TableViewCell.h"
#import "MeData2TableViewCell.h"
#import "MeData3TableViewCell.h"
@interface MeCompanyViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITableView*_tableView;
    UIImageView *_headImgView;
    UILabel * _stateLbl;
    UIView * _bgView;
    NSString * _signatureStr;
    UIPlaceHolderTextView * _textView;
    NSString *_nameStr;
    NSString * _zuojiStr;
    NSString * _phoneStr;
    NSString *_addressStr;
    NSString *_address2Str;

    NSString *_menmianStr;
    NSString *_companTypeStr;
   // NSString *_companTypeStr;
    UIImage *img1;
    UIImage *img2;
    UIImage *img3;
    NSInteger             act_flag;
    NSInteger             image_index;
    NSString* imme_type;


}

@end

@implementation MeCompanyViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self ColorNavigation];
    _bgView.hidden = NO;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
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
    _stateLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, Main_Screen_Width, 20)];
    _stateLbl.textAlignment = NSTextAlignmentCenter;
    _stateLbl.text = @"审核中";
    _stateLbl.textColor = [UIColor whiteColor];
    [view addSubview:_stateLbl];
    return view;
}
-(void)save{
    NSLog(@"%@",_nameStr);
    NSLog(@"%@",_zuojiStr);
    NSLog(@"%@",_phoneStr);
    NSLog(@"%@",_addressStr);
    NSLog(@"%@",_signatureStr);
    NSLog(@"%@",_address2Str);
    NSLog(@"%@",_menmianStr);
    NSLog(@"%@",_companTypeStr);
    NSLog(@"1-%@",img1);
    NSLog(@"2-%@",img2);
    NSLog(@"3-%@",img3);


    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 ||section == 4 || section == 5)
        return 1;
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 1)
        return 80;
    }
    if (indexPath.section == 4) {
        return 130;
    }
    if (indexPath.section == 5) {
        return 110;
    }
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"MeData1TableViewCell";
    static NSString * cellid2 = @"MeData2TableViewCell";
    if (indexPath.section != 5) {
        
        MeData1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell)
            cell = [[[NSBundle mainBundle]loadNibNamed:@"MeData1TableViewCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.textfil.delegate = self;
        if (indexPath.section == 0) {
                cell.titleLbl.text = @"名称";
                cell.textfil.text = _nameStr;
            cell.textfil.placeholder = @"请输入名称";
                cell.textfil.tag = 500;
            return cell;

            
        }
        else if(indexPath.section == 1){
            if (indexPath.row == 0) {
                cell.titleLbl.text = @"电话";
                cell.textfil.placeholder = @"请输入电话号码";

                cell.textfil.tag = 501;
                
                cell.textfil.text = _phoneStr;
                
                cell.textfil.keyboardType = UIKeyboardTypeNumberPad;
                return cell;

            }
            else
            {
                cell.textfil.text = _zuojiStr;
                cell.textfil.tag = 502;
                
                cell.titleLbl.text = @"座机";
                cell.textfil.placeholder = @"请输入座机号码";

                
            }
            return cell;

        }
        else if(indexPath.section == 2){
            if (indexPath.row == 0) {
                cell.titleLbl.text = @"地址";
                cell.textfil.tag = 503;
                cell.textfil.placeholder = @"请输入地址";

                cell.textfil.text = _addressStr;
                return cell;

                
            }
            else
            {
                cell.textfil.text = _address2Str;
                cell.textfil.tag = 504;
                
                cell.titleLbl.text = @"详细地址";
                cell.textfil.placeholder = @"请输入详细地址";

            }
            return cell;

            
        }
        else if(indexPath.section == 3){
            if (indexPath.row == 0) {
                cell.titleLbl.text = @"门头大小";
                cell.textfil.tag = 505;
                
                cell.textfil.text = _menmianStr;
                cell.textfil.userInteractionEnabled = NO;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;

            }
            else
            {
                cell.textfil.text = _companTypeStr;
                cell.textfil.tag = 506;
                
                cell.titleLbl.text = @"公司类别";
                cell.textfil.placeholder = @"请输入公司的类别";

            }
             return cell;
            
        }
        else if(indexPath.section == 4){
            
            MeData3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MeData3TableViewCell"];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"MeData3TableViewCell" owner:self options:nil]lastObject];
            
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (img1) {
                [cell.btn1 setImage:img1 forState:0];
            }
            if (img2) {
                [cell.btn2 setImage:img2 forState:0];
            }
            if (img3) {
                [cell.btn3 setImage:img3 forState:0];
            }
            [cell.btn1 addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn2 addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];

            [cell.btn3 addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
            cell.btn1.tag = 200;
            cell.btn2.tag = 201;
            cell.btn3.tag = 202;

            return cell;
            
            
            
            
            
        }


       
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
        _textView.placeholder = @"公司详情...";

        return cell;
    }
    return [[UITableViewCell alloc]init];

    
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 500)
        _nameStr = textField.text;
    if (textField.tag == 501)
        _phoneStr = textField.text;
    if (textField.tag == 502)
        _zuojiStr = textField.text;
    if (textField.tag == 503)
        _addressStr = textField.text;
    if (textField.tag == 504)
        _address2Str = textField.text;
    if (textField.tag == 505)
        _menmianStr = textField.text;
    if (textField.tag == 506)
        _companTypeStr = textField.text;
    
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
-(void)actionBtn:(UIButton*)btn{
    image_index =btn.tag;

    UIActionSheet *actmenu = [[UIActionSheet alloc]
                              initWithTitle: @"请选择文件操作"
                              delegate:self
                              cancelButtonTitle:@"取消"
                              destructiveButtonTitle:@"选择相册"
                              otherButtonTitles:@"开始拍照"/*,@"开始录音"*/,nil];
    [actmenu showInView:self.view];
    return;

}
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==2) return;
    
    act_flag=buttonIndex;
    
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    if(buttonIndex==1){//拍照
        sourceType=UIImagePickerControllerSourceTypeCamera;
        if (![UIImagePickerController isSourceTypeAvailable:sourceType]){
            kAlertMessage(@"检测到无效的摄像头设备");
            return ;
        }
    }
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    picker.sourceType=sourceType;
    picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:picker animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    if(picker.sourceType==UIImagePickerControllerSourceTypePhotoLibrary){
        NSString *url;
        NSURL    *imageurl;
        
        if(image_index==200){
            imageurl=[info objectForKey:UIImagePickerControllerReferenceURL];
            url=[imageurl absoluteString];
        }
        if(image_index==201){
            imageurl=[info objectForKey:UIImagePickerControllerReferenceURL];
            url=[imageurl absoluteString];
        }
        if(image_index==202){
            imageurl=[info objectForKey:UIImagePickerControllerReferenceURL];
            url=[imageurl absoluteString];
        }
        NSRange range=[url rangeOfString:@"ext="];
        imme_type  =[[url substringFromIndex:range.location+4] lowercaseString];
        
        if(![imme_type isEqualToString:@"png"] &&
           ![imme_type isEqualToString:@"jpeg"] &&
           ![imme_type isEqualToString:@"jpg"]){
            
            kAlertMessage(@"图片非PNG、JPEG、JPG格式");
            return;
        }
    }
    else
        imme_type=@"png";
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self performSelector:@selector(selectPic:) withObject:image afterDelay:0.1];
}
- (void)selectPic:(UIImage*)image
{
    
    
    //1.缩小 2.显示 3.上传
    //    CGSize size=CGSizeMake((btn_upload.frame.size.width-2)*2,(btn_upload.frame.size.height-2)*2);
    //    UIImage *select_image=[ImageUtil scaleImage:image toSize:size];
    if(image_index==200){
        img1 = image;
        
    }
    if(image_index==201){
        img2 = image;

    }
    if(image_index==202){
        img3 = image;

    }
    [_tableView reloadData];
    return;
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
