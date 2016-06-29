//
//  UIWindow+NewFeature.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/6/29.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "UIWindow+NewFeature.h"
#import "LdleFishTabBarController.h"
#import "LdleFishNewFeatrueController.h"

@implementation UIWindow (NewFeature)

- (void)switchRootViewController
{
    NSString *key = @"CFBundleVersion";
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        self.rootViewController = [[LdleFishTabBarController alloc] init];
    } else {
        self.rootViewController = [[LdleFishNewFeatrueController alloc] init];
    }
}

@end
