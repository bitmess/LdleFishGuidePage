//
//  HomeViewController.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/6/29.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "HomeViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "HomeCategoryViewController.h"
#import "Constant.h"
#import "UIImage+Extension.h"

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航栏ButtonItem
    [self setupBarButtonItem];
}

- (void)setupBarButtonItem
{
    // 设置UINavigationBar的背景色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:LFNavigationBarYellowColor] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"home_bar_scan" target:self action:@selector(scan)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"home_category_icon" target:self action:@selector(category)];
    
}

- (void)category
{
    HomeCategoryViewController *category = [[HomeCategoryViewController alloc] init];
    category.title = @"类别";
    [self.navigationController pushViewController:category animated:YES];
}

- (void)scan
{
    
}

@end
