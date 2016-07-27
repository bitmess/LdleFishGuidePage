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
#import "HomeCategoryViewCell.h"

@interface HomeCategoryViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

@end
@implementation HomeCategoryViewController

static NSString *const ID = @"HomeCategoryCellIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航栏ButtonItem
    [self setupBarButtonItem];
    
    // 设置CollectionView的cell
    [self setupCollectionCell];
    
    [self.view addSubview:self.collectionView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:LFNavigationBarYellowColor] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 200;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCategoryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((LFScreenWidth - 2) / 3, (LFScreenWidth - 2) / 3);
}

// 定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0 );
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

// 设置CollectionView的cell
- (void)setupCollectionCell
{
    /**
     *  注册head
     */
    [self.collectionView registerClass:[HomeCategoryViewCell class] forCellWithReuseIdentifier:ID];
    
}

- (void)setupBarButtonItem
{
    // 设置UINavigationBar的背景色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:LFNavigationBarGrayColor] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - Lazy load
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, LFScreenWidth, LFScreenHeight - 64) collectionViewLayout:layout];
        collectionView.backgroundColor = LFRGBColor(247, 247, 247);
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
    }
    return _collectionView;
}

@end
