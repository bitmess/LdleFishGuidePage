//
//  LdleFishNewFeatrueViewCell.m
//  LdleFishGuidePage
//
//  Created by Michael on 16/6/29.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import "LdleFishNewFeatrueViewCell.h"
#import <MediaPlayer/MediaPlayer.h>

@interface LdleFishNewFeatrueViewCell ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerController;

@end
@implementation LdleFishNewFeatrueViewCell

- (void)loadStatus
{
    // 将要自动播放
    if (self.moviePlayerController.loadState == MPMovieLoadStatePlaythroughOK){

        [self.moviePlayerController play];
    }
}

- (void)playFinished
{
    [self.moviePlayerController prepareToPlay];
}

- (void)setMoviePath:(NSString *)moviePath
{
    _moviePath = [moviePath copy];
    
    // 停止之前的播放
    [self.moviePlayerController stop];
    // 设置播放的路径
    self.moviePlayerController.contentURL = [[NSURL alloc] initFileURLWithPath:moviePath];
    [self.moviePlayerController prepareToPlay];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - setter and getter
- (MPMoviePlayerController *)moviePlayerController
{
    if (!_moviePlayerController) {
        
        _moviePlayerController = [[MPMoviePlayerController alloc] init];
   
        [_moviePlayerController setShouldAutoplay:YES];
        
        _moviePlayerController.movieSourceType = MPMovieSourceTypeFile;
        
        _moviePlayerController.controlStyle = MPMovieControlStyleNone;
        _moviePlayerController.view.frame = [UIScreen mainScreen].bounds;

        [self.contentView addSubview:_moviePlayerController.view];
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStatus) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playFinished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];

    }
    return _moviePlayerController;
}

@end
