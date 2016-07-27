//
//  HomeCategoryViewCell.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/27.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "HomeCategoryViewCell.h"
#import "UIButton+VerticalLayout.h"

@interface HomeCategoryViewCell ()

@property (nonatomic, strong) UIButton *verticalButton;

@end
@implementation HomeCategoryViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.verticalButton];
    }
    return self;
}

#pragma mark - Lazy load
- (UIButton *)verticalButton
{
    if (!_verticalButton) {
        _verticalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _verticalButton.frame = self.contentView.frame;
        _verticalButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:14.0];
        [_verticalButton setTitle:@"测试" forState:UIControlStateNormal];
        [_verticalButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_verticalButton setImage:[UIImage imageNamed:@"placeholder120x120"] forState:UIControlStateNormal];
        [_verticalButton setVerticalLayoutWithSpace:6];
    }
    return _verticalButton;
}

@end
