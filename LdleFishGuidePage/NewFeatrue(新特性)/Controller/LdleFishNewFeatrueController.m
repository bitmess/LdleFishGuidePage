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
@property (nonatomic, strong) NSArray *guideImages;
@property (nonatomic, assign, getter=isMovieFinished) BOOL movieFinished;

@end

@implementation LdleFishNewFeatrueController

static NSString * const reuseIdentifier = @"LdleFishNewFeatrueViewCellReuseIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.movieFinished = NO;
    
    [self setupDataSource];
    
    [self.collectionView registerClass:[LdleFishNewFeatrueViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinished) name:PlayFinishedNotify object:nil];
}

- (void)movieFinished
{
    self.movieFinished = YES;
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.guideImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LdleFishNewFeatrueViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.placeholdImage = [UIImage imageNamed:self.guideImages[indexPath.row]];
    cell.moviePath = self.guideMoviePaths[indexPath.row];
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
    if (indexPath.row == self.guideImages.count - 1 && self.movieFinished) {
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

- (void)setupDataSource {
    
    // 设置本地视频路径数组
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        [array addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide%d",i] ofType:@"mp4"]];
    }
    self.guideMoviePaths = array;
    // 设置封面图片数组
    self.guideImages = @[@"guide0", @"guide1", @"guide2", @"guide3"];
    
    self.pageControl.numberOfPages = self.guideImages.count;
    
}

- (void)dealloc
{
    [self.pageControl removeFromSuperview];
    self.pageControl = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - setter and getter
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
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

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        CGFloat width = 120;
        CGFloat height = 30;
        CGFloat x = ([UIScreen mainScreen].bounds.size.width - width) * 0.5;
        CGFloat y = [UIScreen mainScreen].bounds.size.height - 30 - 20;
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(x, y, width, height)];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [self.view insertSubview:_pageControl aboveSubview:self.collectionView];
    }
    return _pageControl;
}

- (NSArray *)guideMoviePaths
{
    if (!_guideMoviePaths) {
        _guideMoviePaths = [NSArray array];
    }
    return _guideMoviePaths;
}

- (NSArray *)guideImages
{
    if (!_guideImages) {
        _guideImages = [NSArray array];
    }
    return _guideImages;
}

@end
