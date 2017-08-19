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

@property (nonatomic, strong) UIImageView *placehlodImageView;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end

@implementation LdleFishNewFeatrueViewCell

- (void)playerDisplayChange {
    if (self.moviePlayer.readyForDisplay) {
        [self.moviePlayer.backgroundView addSubview:self.placehlodImageView];
    }
}

- (void)playFinished {
    [[NSNotificationCenter defaultCenter] postNotificationName:PlayFinishedNotify object:nil];
}

- (void)setMoviePath:(NSString *)moviePath {
    
    _moviePath = [moviePath copy];
    
    // 停止之前的播放
    //    [self.moviePlayer stop];
    self.moviePlayer.view.backgroundColor = [UIColor clearColor];
    // 设置播放的路径
    self.moviePlayer.contentURL = [[NSURL alloc] initFileURLWithPath:moviePath];
    [self.moviePlayer prepareToPlay];
    
    [self.moviePlayer play];
}

- (void)setPlaceholdImage:(UIImage *)placeholdImage {
    _placeholdImage = placeholdImage;
    self.placehlodImageView.image = placeholdImage;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIImageView *)placehlodImageView {
    if (!_placehlodImageView) {
        _placehlodImageView = [[UIImageView alloc] initWithFrame:self.moviePlayer.view.bounds];
        [self.moviePlayer.view addSubview:_placehlodImageView];
    }
    return _placehlodImageView;
}

- (MPMoviePlayerController *)moviePlayer {
    if (!_moviePlayer) {
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc] init];
        [player.view setFrame:self.contentView.bounds];
        // 设置自动播放
        [player setShouldAutoplay:NO];
        // 设置源类型, 因为新特性一般都是播放本地的小视频, 所以设置源类型为File
        player.movieSourceType = MPMovieSourceTypeFile;
        // 取消下面的控制视图: 快进/暂停等...
        player.controlStyle = MPMovieControlStyleNone;
        [self.contentView addSubview:player.view];
        // 监听状态的改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerDisplayChange) name:MPMoviePlayerReadyForDisplayDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playFinished) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
        _moviePlayer = player;
    }
    return _moviePlayer;
}

@end
