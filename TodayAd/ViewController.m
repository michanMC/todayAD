//
//  ViewController.m
//  TodayAd
//
//  Created by michan on 15/8/30.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"
#import "MCNavViewController.h"
#import "leftViewController.h"
#import "RegisterViewController.h"
#import "RESideMenu.h"
@interface ViewController ()<RESideMenuDelegate>

@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(232, 48, 17);
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height/2)];
    imgView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imgView];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(40, Main_Screen_Height - 70, Main_Screen_Width - 2* 40, 35)];
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 1;
    ViewRadius(btn, 5);
    [btn setTitle:@"注册" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn addTarget:self action:@selector(regBtn) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn];
    btn = [[UIButton alloc]initWithFrame:CGRectMake(40, Main_Screen_Height - 70 - 35 - 15, Main_Screen_Width - 2* 40, 35)];
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 1;
    ViewRadius(btn, 5);
    [btn setTitle:@"直接登录" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(initLanuchView) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)initLanuchView
{

    //进入首页
    HomeViewController *main = [[HomeViewController alloc] init];
      UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
    leftViewController *leftMenuViewController = [[leftViewController alloc] init];
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:nav
                                                                    leftMenuViewController:leftMenuViewController
                                                                   rightMenuViewController:nil];
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"bg1"];
//    sideMenuViewController.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
//    sideMenuViewController.delegate = self;
//    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
//    sideMenuViewController.scaleMenuView = YES;
//    sideMenuViewController.panGestureEnabled = YES;
//    sideMenuViewController.contentViewShadowRadius = 12;
//    sideMenuViewController.contentViewShadowEnabled = YES;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = sideMenuViewController;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    HomeViewController *centerVC = [[HomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:centerVC];
    
    //初始化侧滑控制器
    PPRevealSideViewController *revealVC = [[PPRevealSideViewController alloc] initWithRootViewController:nav];
   revealVC.fakeiOS7StatusBarColor = RGBCOLOR(254, 94, 101);//[UIColor yellowColor];
    //把侧滑控制器作为窗口根控制器
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController =revealVC ;
    // 没有注销且seesion没过期才可以直接进入主界面
     */
    NSString* logout = [[NSUserDefaults standardUserDefaults] objectForKey:@"isLogOut"];
    if ( [logout isEqualToString:@"1"] && [[NSUserDefaults standardUserDefaults] objectForKey:@"sessionId"] != nil) {
        
        
    }else{
        
//        LoginViewController *loginVC = [[LoginViewController alloc]init];
//        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        MCNavViewController *nav = [[MCNavViewController alloc]initWithRootViewController:loginVC];
//        appDelegate.window.rootViewController = nav;
        
    }
}
-(void)regBtn{
    RegisterViewController * ctl = [[RegisterViewController alloc]init];
    [self pushNewViewController:ctl];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    appDelegate.window.rootViewController =nav ;
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
