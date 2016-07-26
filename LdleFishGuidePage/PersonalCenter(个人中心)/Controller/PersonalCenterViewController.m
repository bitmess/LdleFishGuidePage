//
//  PersonalCenterViewController.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/6/29.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "UIImage+Extension.h"
#import "Constant.h"

@implementation PersonalCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 设置导航栏ButtonItem
    [self setupBarButtonItem];
}

- (void)setupBarButtonItem
{
    // 设置UINavigationBar的背景色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:LFNavigationBarYellowColor] forBarMetrics:UIBarMetricsDefault];
}


@end
