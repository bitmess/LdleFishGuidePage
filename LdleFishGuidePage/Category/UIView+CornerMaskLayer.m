//
//  UIView+CornerMaskLayer.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/28.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "UIView+CornerMaskLayer.h"

@implementation UIView (CornerMaskLayer)

- (void)addCornerMaskLayerWithRadius:(CGFloat)radius
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                       byRoundingCorners:UIRectCornerAllCorners
                                             cornerRadii:CGSizeMake(radius, radius)]
    .CGPath;
    self.layer.mask = layer;
}

@end
