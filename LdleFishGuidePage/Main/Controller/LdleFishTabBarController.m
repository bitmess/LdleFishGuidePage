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
#import "LdleFishTabBar.h"
#import "UIView+Extension.h"

@interface LdleFishTabBarController ()<LdleFishTabBarDelegate, UIActionSheetDelegate>

@end

@implementation LdleFishTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addChildViewController:home andWithTitle:@"闲鱼" andWithImage:@"home_normal" andWithSelectedImage:@"home_highlight"];
    
    FishPondViewController *fishPond = [[FishPondViewController alloc]init];
    [self addChildViewController:fishPond andWithTitle:@"鱼塘" andWithImage:@"fishpond_normal" andWithSelectedImage:@"fishpond_highlight"];
    
    MessageViewController *message = [[MessageViewController alloc] init];
    [self addChildViewController:message andWithTitle:@"消息" andWithImage:@"message_normal" andWithSelectedImage:@"message_highlight"];

    PersonalCenterViewController *personalCenter = [[PersonalCenterViewController alloc] init];
    [self addChildViewController:personalCenter andWithTitle:@"我的" andWithImage:@"account_normal" andWithSelectedImage:@"account_highlight"];
    
    [self setupTabBar];
    
}

- (void)setupTabBar
{
    LdleFishTabBar *tabBar = [[LdleFishTabBar alloc] init];
    tabBar.ldleFishDelegate = self;
    [[LdleFishTabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[LdleFishTabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)tabBar:(UITabBar *)tabBar didClickLdleFishButton:(UIButton *)button
{
  
}

- (void)addChildViewController:(UIViewController *)childViewController andWithTitle:(NSString *)title andWithImage:(NSString *)image andWithSelectedImage:(NSString *)selectedImage;
{
    
    childViewController.title = title;
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10.0];
    
    [childViewController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    NSMutableDictionary *textSelectAttrs = [NSMutableDictionary dictionary];
    textSelectAttrs[NSForegroundColorAttributeName] = [[UIColor alloc]initWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0];
    [childViewController.tabBarItem setTitleTextAttributes:textSelectAttrs forState:UIControlStateSelected];
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LdleFishNavigationController *navController = [[LdleFishNavigationController alloc] initWithRootViewController:childViewController];
    [self addChildViewController:navController];
}


@end
