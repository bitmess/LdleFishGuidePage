//
//  LdleFishTabBar.h
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/25.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LdleFishTabBarDelegate <NSObject>

- (void)tabBar:(UITabBar *)tabBar didClickLdleFishButton:(UIButton *)button;

@end

@interface LdleFishTabBar : UITabBar

@property (nonatomic, weak) id<LdleFishTabBarDelegate> ldleFishDelegate;

@end
