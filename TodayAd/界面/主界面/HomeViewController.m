//
//  HomeViewController.m
//  TodayAd
//
//  Created by michan on 15/8/30.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "HomeViewController.h"
#import "leftViewController.h"
#import "WHC_ContainerView.h"
#import "WHC_ContainerBar.h"
#import "oneView.h"
#import "WHC_BadgeView.h"
#import "MCTabButton.h"
#import "MyReleaseViewController.h"
#import "SeachViewController.h"
#import "ScreenViewController.h"
#import "LoginUIViewController.h"
#import "RESideMenu.h"
#import "SentriesViewController.h"
#import "MeCompanyViewController.h"
#import "MeDataViewController.h"
@interface HomeViewController ()<WHC_ContainerViewDelegate>{
    UINavigationController *leftNav;
    NSMutableArray  * viewArr ;
    UIView * _toolbarView;


}
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *pageViews;
@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    self.navigationController.navigationBar.barTintColor =       AppCOLOR;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor whiteColor], NSForegroundColorAttributeName,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:40.0], NSFontAttributeName,
                                                                     nil]];

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //[self.navigationController setToolbarHidden:YES animated:NO];
    self.navigationController.toolbarHidden = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"今天大牌";
    UIImageView * img = [[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, 100, 20)];
    img.image = [UIImage imageNamed:@"logo"];

    self.navigationItem.titleView = img;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectObj:) name:@"didSelectObjNotification" object:nil];

    
    viewArr = [NSMutableArray array];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.navigationController.navigationBar.barTintColor =       AppCOLOR;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
#pragma mark-监听
- (void)didSelectObj:(NSNotification *)notication
{
    NSLog(@"%@",notication);
    
    //取值
    NSString *reveiveString = notication.object;
    
    NSLog(@"%@",reveiveString);
    if([reveiveString isEqualToString:@"登录"]){
        LoginUIViewController * ctl = [[LoginUIViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    else if ([reveiveString isEqualToString:@"我的资料"]){
        MeCompanyViewController * ctl = [[MeCompanyViewController alloc]init];
#warning 个人
       // MeDataViewController * ctl = [[MeDataViewController alloc]init];
        [self pushNewViewController:ctl];
    }


}

-(void)prepareUI{
    
//    leftViewController *leftMenuViewController = [[leftViewController alloc] init];
//    leftNav = [[UINavigationController alloc] initWithRootViewController:leftMenuViewController];
//    //装载控制器
//   [self.revealSideViewController preloadViewController:leftNav forSide:PPRevealSideDirectionLeft];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"personage_n"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];

//self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"personage_n"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftViewController)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(showrightViewController)];

    
    [self prepareUI2];

}
-(void)prepareUI2{
    CGRect  containerViewRC = {0.0,64.0,Main_Screen_Width,Main_Screen_Height - 64 - 44};

    NSArray         * titles = @[@"推荐",@"广州",@"户外",@"公司",@"个人",@"LED",@"互联网"];
    NSMutableArray  * titlesArr = [titles mutableCopy];
    NSArray         * laterTitlesArr =  @[@"电视",@"新媒体",@"纸媒",@"营销",@"策划",@"制作",@"设备",@"材料",@"电台",@"新闻"];
    WHC_ContainerBarParam * param =  [WHC_ContainerBarParam getWHC_ContainerViewParamWithTitles:titlesArr laterTitlesArr:[laterTitlesArr mutableCopy]];
    param.visableCursor = YES;
    param.isHeaderLine = NO;
    param.isFootLine = NO;
    param.isSegmentLine = NO;
    param.focusFontSize = 18;
    param.fontSize = 15;
    param.itemBarSBackgroudColor = [UIColor groupTableViewBackgroundColor];
    
    WHC_ContainerView  * containerView = [[WHC_ContainerView alloc]initWithFrame:containerViewRC param:param];
    containerView.delegate = self;
    //containerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
       [self.view addSubview:containerView];
    
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/7, 44)];
       [btn setImage:[UIImage imageNamed:@"filter"] forState:0];
    btn.tag = 100;
    [btn addTarget:self action:@selector(actionItem:) forControlEvents:UIControlEventTouchUpInside];
      UIBarButtonItem *btn1=[[UIBarButtonItem alloc]initWithCustomView:btn];
    btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/7, 44)];
    [btn setImage:[UIImage imageNamed:@"publish1"] forState:0];
    btn.tag = 101;
    [btn addTarget:self action:@selector(actionItem:) forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *btn2=[[UIBarButtonItem alloc]initWithCustomView:btn];
    btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/7, 44)];
    [btn setImage:[UIImage imageNamed:@"setting1"] forState:0];
    btn.tag = 102;
    [btn addTarget:self action:@selector(actionItem:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn3=[[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *btn4=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];//
    NSArray *arr1=[[NSArray alloc]initWithObjects:btn1,btn4,btn2,btn4,btn3, nil];
    self.toolbarItems=arr1;
}
#pragma mark - WHC_ContainerViewDelegate -

- (NSArray *)whc_ContainerView:(WHC_ContainerView *)containerView updateContainerViewLayoutWithTitlesArr:(NSArray *)titlesArr{
    for (NSInteger i = 0; i < viewArr.count;) {
        oneView  * view = viewArr[i];
        [view removeFromSuperview];
        [viewArr removeObject:view];
        view = nil;
    }
    CGRect  containerViewRC = {0.0,64.0,self.view.width,Main_Screen_Height - 64.0 - 40 - 44};
    for (NSString * title in titlesArr) {
        oneView  * view = [[oneView alloc]initWithFrame:containerViewRC title:title];
        [viewArr addObject:view];
    }
    return viewArr;
}
#pragma mark-触发底下actionItem
-(void)actionItem:(UIBarButtonItem*)item{
    NSLog(@"%ld",item.tag);
    CATransition * animation = [CATransition animation];
    animation.type = @"moveIn";
    animation.subtype = kCATransitionFromTop;
    animation.duration = 0.3;
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    if (item.tag==100) {
        ScreenViewController * ctl = [[ScreenViewController alloc]init];
        [self.navigationController pushViewController:ctl animated:NO];

    }
   else if (item.tag==101) {
        MyReleaseViewController * ctl = [[MyReleaseViewController alloc]init];
       [self.navigationController pushViewController:ctl animated:NO];
        //[self presentViewController:ctl animated:YES completion:nil];
    }
   else if (item.tag==102) {
       SentriesViewController * ctl = [[SentriesViewController alloc]init];
       [self.navigationController pushViewController:ctl animated:NO];
       //[self presentViewController:ctl animated:YES completion:nil];
   }

}
- (void)whc_ContainerView:(WHC_ContainerView *)containerView loadContentForCurrentView:(UIView *)currentView currentIndex:(NSInteger)index{
    //切换pageView的时候这里会调用来更新currentview 的内容
    //    NSLog(@"title = %@",[((oneView *)currentView) getTitle]);
    [((oneView*)currentView) reloadView];
}

-(void)showrightViewController{
    SeachViewController * ctl = [[SeachViewController alloc]init];
    [self pushNewViewController:ctl];
    
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
