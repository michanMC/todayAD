//
//  cehuaViewController.m
//  TodayAd
//
//  Created by MC on 15/10/24.
//  Copyright © 2015年 MC. All rights reserved.
//

#import "cehuaViewController.h"
#import "huwai1TableViewCell.h"
#import "huwai3TableViewCell.h"
#import "huwai4TableViewCell.h"
#import "huwai2TableViewCell.h"

@interface cehuaViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITableView *_tableView;
    NSArray * lblArray;
    NSArray * palblArray;
    
    
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
    NSString * _shoufeiStr;//收费
    
    NSString * _cehuaiStr;//策划
    NSString * _dianhuaStr;//电话
    
    NSString * _diquStr;//地区
    NSString * _xiangqingStr;//详情

}

@end

@implementation cehuaViewController
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
    lblArray = @[@[@"标题",@"收费标准"],@[@"策划类型",@"电话"],@[@"所在地区",@"详情"]];
    palblArray = @[@[@"输入标题",@"个"],@[@"婚礼策划",@"电话"],@[@"请选择",@"输入详情"]];
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
    imgView.image = [UIImage imageNamed:@"bg6"];
    [view addSubview:imgView];
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 20, 20)];
    [backBtn setImage:[UIImage imageNamed:@"back"] forState:0];
    [view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(backBtn:) forControlEvents:UIControlEventTouchUpInside];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 25, Main_Screen_Width, 20)];
    lbl.text = @"策划";
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    if (indexPath.section == 1) {
    //        if(indexPath.row == 1)
    //            return 134;
    //    }
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
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid2 = @"huwai2TableViewCell";
    
    static NSString * cellid3 = @"huwai3TableViewCell";
    
    //1,3
    if (indexPath.section == 0) {
         if(indexPath.row ==0){
            huwai2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai2TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.lbl.text = lblArray[indexPath.section][indexPath.row];
            cell.text.placeholder = palblArray[indexPath.section][indexPath.row];
            
            cell.text.text = _biaotiStr;
            
            cell.text.tag = 600;
            cell.text.delegate = self;
            return cell;
        }
        if (indexPath.row == 1) {
            huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.letlbl.text = lblArray[indexPath.section][indexPath.row];
            cell.rigLbl.text = palblArray[indexPath.section][indexPath.row];
            cell.rigLbl.text = _shoufeiStr;
            return cell;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.letlbl.text = lblArray[indexPath.section][indexPath.row];
            cell.rigLbl.text = palblArray[indexPath.section][indexPath.row];
            cell.rigLbl.text = _cehuaiStr;
            return cell;
        }
        if (indexPath.row == 1) {
            huwai2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
            if (!cell)
                cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai2TableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            cell.lbl.text = lblArray[indexPath.section][indexPath.row];
            cell.text.placeholder = palblArray[indexPath.section][indexPath.row];
            
            cell.text.text = _dianhuaStr;
            
            cell.text.tag = 700;
            cell.text.delegate = self;
            return cell;
            
        }
    }
        if (indexPath.section == 2) {
            if (indexPath.row == 0) {
                huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
                if (!cell)
                    cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.letlbl.text = lblArray[indexPath.section][indexPath.row];
                cell.rigLbl.text = palblArray[indexPath.section][indexPath.row];
                cell.rigLbl.text = _diquStr;
                return cell;
            }
            if (indexPath.row == 1) {
                huwai3TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid3];
                if (!cell)
                    cell = [[[NSBundle mainBundle]loadNibNamed:@"huwai3TableViewCell" owner:self options:nil]lastObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.letlbl.text = lblArray[indexPath.section][indexPath.row];
                cell.rigLbl.text = palblArray[indexPath.section][indexPath.row];
                cell.rigLbl.text = _xiangqingStr;
                return cell;
                
            }

        
        }
    return [[UITableViewCell alloc]init];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
}


-(void)backBtn:(UIButton*)btn{
    [self.navigationController popViewControllerAnimated:YES];
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
