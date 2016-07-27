//
//  UIButton+VerticalLayout.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/27.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "UIButton+VerticalLayout.h"

@implementation UIButton (VerticalLayout)

- (void)setVerticalLayoutWithSpace:(CGFloat)itemSpace
{
    CGFloat spacing = itemSpace;
    
    CGSize imageSize = self.imageView.image.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + spacing), 0.0);
    
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, -titleSize.width);
}

@end
