//
//  HomeCategoryViewController.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/26.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "HomeCategoryViewController.h"
#import "Constant.h"
#import "UIImage+Extension.h"

@implementation HomeCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航栏ButtonItem
    [self setupBarButtonItem];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:LFNavigationBarYellowColor] forBarMetrics:UIBarMetricsDefault];
}

- (void)setupBarButtonItem
{
    // 设置UINavigationBar的背景色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:LFNavigationBarGrayColor] forBarMetrics:UIBarMetricsDefault];
}

@end
