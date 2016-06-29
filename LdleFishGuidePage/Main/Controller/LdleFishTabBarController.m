//
//  LdleFishTabBarController.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/6/29.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "LdleFishTabBarController.h"
#import "PersonalCenterViewController.h"
#import "MessageViewController.h"
#import "FishPondViewController.h"
#import "HomeViewController.h"
#import "LdleFishNavigationController.h"

@implementation LdleFishTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    HomeViewController *home = [[HomeViewController alloc] init];
    [self addChildViewController:home andWithTitle:@"首页" andWithImage:@"fx_home_homeicon" andWithSelectedImage:@"fx_home_homeicon2"];
    
    FishPondViewController *fishPond = [[FishPondViewController alloc]init];
    [self addChildViewController:fishPond andWithTitle:@"鱼塘" andWithImage:@"fx_home_info" andWithSelectedImage:@"fx_home_info2"];
    
    MessageViewController *message = [[MessageViewController alloc] init];
    [self addChildViewController:message andWithTitle:@"消息" andWithImage:@"fx_home_randhouse" andWithSelectedImage:@"fx_home_randhouse2"];

    PersonalCenterViewController *personalCenter = [[PersonalCenterViewController alloc] init];
    [self addChildViewController:personalCenter andWithTitle:@"个人中心" andWithImage:@"fx_home_mineicon" andWithSelectedImage:@"fx_home_mineicon2"];
    
}

- (void)addChildViewController:(UIViewController *)childViewController andWithTitle:(NSString *)title andWithImage:(NSString *)image andWithSelectedImage:(NSString *)selectedImage;
{
    
    childViewController.title = title;
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10.0];
    
    [childViewController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *textSelectAttrs = [NSMutableDictionary dictionary];
    textSelectAttrs[NSForegroundColorAttributeName] = [[UIColor alloc]initWithRed:54/255.0 green:185/255.0 blue:175/255.0 alpha:1.0];
    [childViewController.tabBarItem setTitleTextAttributes:textSelectAttrs forState:UIControlStateSelected];
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LdleFishNavigationController *navController = [[LdleFishNavigationController alloc] initWithRootViewController:childViewController];
    [self addChildViewController:navController];
}


@end
