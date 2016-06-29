//
//  LdleFishNewFeatrueViewCell.h
//  LdleFishGuidePage
//
//  Created by Michael on 16/6/29.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import <UIKit/UIKit.h>

// 是否播放完成
typedef void(^MoviePlayFinishedBlock) (BOOL);

@interface LdleFishNewFeatrueViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *moviePath;
@property (nonatomic, copy) MoviePlayFinishedBlock finishedBlock;

@end
