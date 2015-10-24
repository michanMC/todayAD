//
//  huwaiViewController.m
//  TodayAd
//
//  Created by air on 15/10/3.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "huwaiViewController.h"
#import "huwai1TableViewCell.h"
#import "huwai2TableViewCell.h"
#import "huwai3TableViewCell.h"
#import "huwai4TableViewCell.h"
#import "huwai5TableViewCell.h"
#import "huwai6TableViewCell.h"
#import "huwai7TableViewCell.h"

@interface huwaiViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UITableView *_tableView;
    NSArray * lblArray;
    NSArray * palblArray;
    NSInteger _section1;
    
    
    UIImageView * _imgView1;
    UIImageView * _imgView2;
    UIImageView * _imgView3;
    UIButton *_deleteBtn1;
    UIButton *_deleteBtn2;
    UIButton *_deleteBtn3;
    NSInteger             image_index;
    NSInteger             act_flag;//当前点击的图片
    NSString* imme_type;

    
    NSString * _biaotiStr;//标题
    NSString * _jiaqianStr;//价格
    NSString * _phoneStr;//电话
    NSString * _meitiStr;//媒体型
    NSString * _biaoxianStr;//表现
    NSString * _xiangqingStr;//详情
    
    
    NSString * _diquStr;//地区
    NSString * _caiziStr;//材质
    NSString * _changStr;//价格->长
    NSString * _gaoStr;//价格-》高
    NSString * _mianStr;//价格-》面
    NSString * _zongjiaStr;//价格-》总价
    NSString * _zhuantaiStr;//状态
    NSString * _dailiStr;//代理
    NSString * _zhaomingStr;//照明方式
    NSString * _kaishiStr;//照明开始
    NSString * _jieshuStr;//结束
    NSString * _zhouqiStr;//周期
    NSString * _zaotouStr;//早投
    NSString * _daoqiStr;//到期
    NSString * _renliuStr;//人流
    NSString * _cheliuStr;//车流

    
    
    
    

}

@end

@implementation huwaiViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    lblArray = @[@"标题",@"价格",@"电话",@"媒体类型",@"表现形式",@"详情"];
    palblArray = @[@"输入标题",@"输入价格",@"输入电话号码"];
    _section1 = 1;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = [self headView];
    _tableView.tableFooterView = [self foerView];
    // Do any additional setup after loading the view.
}
-(UIView*)foerView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(30, 30, Main_Screen_Width - 60, 30)];
    btn.backgroundColor = AppCOLOR;
    ViewRadius(btn, 5);
    [btn setTitle:@"发布" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [view addSubview:btn];
    return view;
    
    
}
-(UIView*)headView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 250)];
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:view.bounds];
    imgView.image = [UIImage imageNamed:@"bg2"];
    [view addSubview:imgView];
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 20, 20)];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:0];
    [view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 25, Main_Screen_Width, 20)];
    lbl.text = @"户外";
    lbl.textColor = [UIColor whiteColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lbl];
    UIButton * cameraBtn = [[UIButton alloc]initWithFrame:CGRectMake((Main_Screen_Width - 50) / 2, (250 - 50) / 2, 50, 50)];
    [cameraBtn setImage:[UIImage imageNamed:@"camera"] forState:0];
    [cameraBtn addTarget:self action:@selector(loadimg:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:cameraBtn];
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, (250 - 50) / 2 + 50 + 5, Main_Screen_Width, 20)];
    lbl.text = @"添加照片";
    lbl.font = AppFont;
    lbl.textColor = [UIColor whiteColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lbl];
    
    CGFloat x = 30;
    CGFloat y = 250 - 50 -10;
    CGFloat width = 50;
    CGFloat height = 50;
    _imgView1  =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    _imgView1.userInteractionEnabled  =YES;

    _imgView1.hidden = YES;
    _imgView1.layer.borderColor = [UIColor whiteColor].CGColor;
    _imgView1.layer.borderWidth = 1;
    [view addSubview:_imgView1];
    _deleteBtn1 = [[UIButton alloc]initWithFrame:CGRectMake(70, y -10, 20, 20)];
    [_deleteBtn1 setBackgroundImage:[UIImage imageNamed:@"menu_icon_delete"] forState:0];
    [_deleteBtn1 addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    _deleteBtn1.hidden = YES;
    [view addSubview:_deleteBtn1];
    
    
    
    x += width+15;
    _imgView2  =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    _imgView2.userInteractionEnabled  =YES;

    _imgView2.hidden = YES;
    _imgView2.layer.borderColor = [UIColor whiteColor].CGColor;
    _imgView2.layer.borderWidth = 1;
    [view addSubview:_imgView2];
    _deleteBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(70 + 15 + 50, y - 10, 20, 20)];
    [_deleteBtn2 setBackgroundImage:[UIImage imageNamed:@"menu_icon_delete"] forState:0];
    [_deleteBtn2 addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    _deleteBtn2.hidden = YES;

    [view addSubview:_deleteBtn2];
    

    
    
    x += width+15;
    _imgView3  =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, width, height)];
    _imgView3.userInteractionEnabled  =YES;
    _imgView3.hidden = YES;
    _imgView3.layer.borderColor = [UIColor whiteColor].CGColor;
    _imgView3.layer.borderWidth = 1;
    [view addSubview:_imgView3];
    _deleteBtn3 = [[UIButton alloc]initWithFrame:CGRectMake(70 +  (15 + 50)*2, y - 10, 20, 20)];
    [_deleteBtn3 setBackgroundImage:[UIImage imageNamed:@"menu_icon_delete"] forState:0];
    [_deleteBtn3 addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    _deleteBtn3.hidden = YES;

    [view addSubview:_deleteBtn3];

    
    return view;

    
}
-(void)backBtn:(UIButton*)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 7;
    }
    return _section1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if(indexPath.row == 1)
            return 134;
    }
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid1 = @"huwai1TableViewCell";
    static NSString * cellid2 = @"huwai2TableViewCell";
    static NSString * cellid3 = @"huwai3TableViewCell";
    static NSString * cellid4 = @"huwai4TableViewCell";
    static NSString * cellid5 = @"huwai5TableViewCell";
    static NSString * cellid6 = @"huwai6TableViewCell";
    static NSString * cellid7 = @"huwai7TableViewCell";

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            huwai1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid1];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai1TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else if(indexPath.row <4 && indexPath.row != 0){
            huwai2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai2TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            cell.lbl.text = lblArray[indexPath.row - 1];
            cell.text.placeholder = palblArray[indexPath.row - 1];
            if(indexPath.row == 1){
                cell.text.text = _biaotiStr;
                
                cell.text.tag = 600;
            }
            else if(indexPath.row == 2){
                cell.text.text = _jiaqianStr;
                cell.text.tag = 601;
            }
            else if(indexPath.row == 3){
                cell.text.text = _phoneStr;
                cell.text.tag = 602;
            }
            cell.text.delegate = self;
            return cell;
        }
        huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
        if (!cell)
            cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.letlbl.text = lblArray[indexPath.row - 1];
        cell.rigLbl.text = @"请选择";

        if (indexPath.row == 6) {
            cell.rigLbl.text = @"请输入";
            cell.rigLbl.text = _xiangqingStr;

        }
        else if(indexPath.row == 5){
            cell.rigLbl.text = _biaoxianStr;

        }else if(indexPath.row == 4){
            cell.rigLbl.text = _meitiStr;
            
        }
        return cell;

    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            huwai1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid1];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai1TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
cell.titleLbl.text = @"选填项";
            return cell;
        }
        if (indexPath.row == 1) {
            huwai4TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid4];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai4TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.diziLbl.text = _diquStr;
            cell.caizitext.text = _caiziStr;
            cell.caizitext.delegate = self;
            cell.caizitext.tag = 603;
            
            cell.changtext.text = _changStr;
            cell.changtext.delegate = self;
            cell.changtext.tag = 604;
            
            cell.gaotext.text = _gaoStr;
            cell.gaotext.delegate = self;
            cell.gaotext.tag = 605;
            
            cell.mianText.text = _mianStr;
            cell.mianText.delegate = self;
            cell.mianText.tag = 606;
            
            cell.daxiaoText.text = _zongjiaStr;
            cell.daxiaoText.delegate = self;
            cell.daxiaoText.tag = 607;
            cell.imgView.image =[UIImage imageNamed:@"Location"];
            return cell;
        }
        if (indexPath.row == 2) {
            huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.letlbl.text = @"媒体状态";//lblArray[indexPath.row - 1];
            cell.rigLbl.text = @"待售";//_zhuantaiStr
            
        return cell;

        }
        if (indexPath.row == 3) {
            huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.letlbl.text = @"广告代理方式";//lblArray[indexPath.row - 1];
            cell.rigLbl.text = @"自有媒体";//_dailiStr
            
            return cell;
            
        }
        if (indexPath.row == 4) {
            huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.letlbl.text = @"照明方式";//lblArray[indexPath.row - 1];
            cell.rigLbl.text = @"内照明";//_zhaomingStr
            
            return cell;
            
        }
        if (indexPath.row == 5) {
            huwai5TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid5];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai5TableViewCell" owner:self options:nil]lastObject];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            cell.kaishiText.delegate = self;
            cell.kaishiText.text  =_kaishiStr;
            cell.kaishiText.tag  = 608;
            
            cell.jieshuText.delegate = self;
            cell.jieshuText.text  =_jieshuStr;
            cell.jieshuText.tag  = 609;

            
            
                     return cell;
            
        }
        if (indexPath.row == 6) {
            huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.letlbl.text = @"最少投放周期";//lblArray[indexPath.row - 1];
            cell.rigLbl.text = @"一个月";//_zhouqiStr
            
            return cell;
            
        }
        if (indexPath.row == 7) {
            huwai6TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid6];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai6TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.leLbl.text = @"最早投放日";//lblArray[indexPath.row - 1];
            cell.dateLbl.text = @"2015-09-13";//_zaotouStr
            
            return cell;
            
        }
        if (indexPath.row == 8) {
            huwai6TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid6];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai6TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.leLbl.text = @"所有权到期日";//lblArray[indexPath.row - 1];
            cell.dateLbl.text = @"2015-09-13";//_daoqiStr
            
            return cell;
            
        }
        if (indexPath.row == 9) {
            huwai7TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid7];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai7TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.lelbl.text = @"估计人流";//lblArray[indexPath.row - 1];
            cell.countText.text= _renliuStr;
            cell.countText.tag =610;
            cell.countText.delegate = self;

            return cell;
            
        }
        if (indexPath.row == 10) {
            huwai7TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid7];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai7TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.lelbl.text = @"估计车流";//lblArray[indexPath.row - 1];
            //cell.dateLbl.text = @"2015-09-13";
            cell.countText.text= _cheliuStr;
            cell.countText.tag =611;
            cell.countText.delegate = self;
            return cell;
            
        }




    }
    
    
    return [[UITableViewCell alloc]init];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            if (_section1 == 11)
                _section1 = 1;
            else
            _section1 = 11;
            [tableView reloadData];
        }
    }
 
    
    
}
#pragma mark-选择图片
-(void)loadimg:(UIButton*)btn{
    
    
    if (_imgView1.hidden) {
      image_index =1;
    }
    else if(_imgView2.hidden){
        image_index =2;

    }
    else if(_imgView3.hidden){
        image_index =3;
        
    }

    
    
    
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
        if(image_index==1){
            imageurl=[info objectForKey:UIImagePickerControllerReferenceURL];
            url=[imageurl absoluteString];
        }
        if(image_index==2){
            imageurl=[info objectForKey:UIImagePickerControllerReferenceURL];
            url=[imageurl absoluteString];
        }
        if(image_index==3){
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
    if(image_index==1){
        _imgView1.image = image;
        _imgView1.hidden = NO;
        _deleteBtn1.hidden = NO;

        //self.image_data1=UIImagePNGRepresentation(image);
    }
    if(image_index==2){
        _imgView2.image = image;
        _imgView2.hidden = NO;
        _deleteBtn2.hidden = NO;

        // self.image_data2=UIImagePNGRepresentation(image);
    }
    if(image_index==3){
        _imgView3.image = image;
        _imgView3.hidden = NO;
        _deleteBtn3.hidden = NO;

        //self.image_data3=UIImagePNGRepresentation(image);
    }
    
    return;
}
#pragma mark-删除图片
-(void)deleteBtn:(UIButton*)btn{
    
    
    if (btn == _deleteBtn1) {
        _imgView1.image = nil;
        _imgView1.hidden = YES;
        _deleteBtn1.hidden = YES;

    }else if(btn == _deleteBtn2){
        _imgView2.image = nil;
        _imgView2.hidden = YES;
        _deleteBtn2.hidden = YES;

    }
    else if(btn == _deleteBtn3){
        _imgView3.image = nil;
        _imgView3.hidden = YES;
        _deleteBtn3.hidden = YES;

        
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
