//
//  LdleFishNewFeatrueController.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/6/29.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "LdleFishNewFeatrueController.h"
#import "LdleFishNewFeatrueViewCell.h"
#import "LdleFishTabBarController.h"

@interface LdleFishNewFeatrueController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *guideMoviePaths;
@property (nonatomic, assign, getter=isMovieFinished) BOOL movieFinished;

@end

@implementation LdleFishNewFeatrueController

static NSString * const reuseIdentifier = @"LdleFishNewFeatrueViewCellReuseIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[LdleFishNewFeatrueViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    

    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        [array addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide%d",i] ofType:@"mp4"]];
    }
    self.guideMoviePaths = array;
    
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.guideMoviePaths.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LdleFishNewFeatrueViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.moviePath = self.guideMoviePaths[indexPath.row];
    
    cell.finishedBlock = ^(BOOL finished){
        self.movieFinished = finished;
    };
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.guideMoviePaths.count - 1) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [[LdleFishTabBarController alloc] init];
        CATransition *anim = [CATransition animation];
        anim.type = @"rippleEffect";
        anim.duration = 2;
        [window.layer addAnimation:anim forKey:nil];
    }
}

#pragma mark <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    uint page = (scrollView.contentOffset.x / scrollView.bounds.size.width) + 0.5;
    self.pageControl.currentPage = page;
}

#pragma mark - setter and getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSArray *)guideMoviePaths
{
    if (!_guideMoviePaths) {
        _guideMoviePaths = [NSArray array];
    }
    return _guideMoviePaths;
}

@end
