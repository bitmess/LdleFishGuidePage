//
//  LdleFishTabBar.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/25.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "LdleFishTabBar.h"
#import "LdleFishButton.h"
#import "UIView+Extension.h"

@interface LdleFishTabBar ()

@property (nonatomic, strong) LdleFishButton *button;

@end
@implementation LdleFishTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self ldleFishTabBarStyle];
        
        [self setupLdleFinshButton];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self ldleFishTabBarStyle];
        
        [self setupLdleFinshButton];
    }
    return self;
}

- (void)ldleFishTabBarStyle
{
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, [UIScreen mainScreen].bounds.size.width, 5)];
    topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
    [self addSubview:topLine];
}

- (void)setupLdleFinshButton
{
    LdleFishButton *button = [LdleFishButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    button.titleEdgeInsets = UIEdgeInsetsMake(78, 0, 0, 0);
    button.size = button.currentBackgroundImage.size;
    [button addTarget:self action:@selector(releaseButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    self.button = button;

}

- (void)releaseButtonClick:(UIButton *)button
{
    if ([self.ldleFishDelegate respondsToSelector:@selector(tabBar:didClickLdleFishButton:)]) {
        [self.ldleFishDelegate tabBar:self didClickLdleFishButton:button];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.button.centerX = self.width * 0.5;
    self.button.y = -25;
    
    CGFloat tabBarButtonWidth = self.width / 5;
    CGFloat tabbBarButtonIndex = 0;
    
    for (UIView *child in self.subviews) {
        Class class =  NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width = tabBarButtonWidth;
            child.x = tabbBarButtonIndex * tabBarButtonWidth;
            tabbBarButtonIndex++;
            if (tabbBarButtonIndex == 2) {
                tabbBarButtonIndex++;
            }
        }
    }
}

@end
