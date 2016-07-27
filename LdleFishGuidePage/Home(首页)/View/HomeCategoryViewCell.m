//
//  HomeCategoryViewCell.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/27.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "HomeCategoryViewCell.h"

@interface HomeCategoryViewCell ()

@property (nonatomic, weak) UIButton *verticalButton;

@end
@implementation HomeCategoryViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

#pragma mark - Lazy load
- (UIButton *)verticalButton
{
    if (!_verticalButton) {
        UIButton *verticalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _verticalButton;
}

@end
