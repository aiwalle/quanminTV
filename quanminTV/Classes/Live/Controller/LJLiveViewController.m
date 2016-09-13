//
//  LJLiveViewController.m
//  quanminTV
//
//  Created by liang on 16/8/31.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJLiveViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "LJMainLinkObject.h"
#import "LJLiveTextView.h"
#import "LJLiveChatView.h"
#import "LJLiveAnchorView.h"
@interface LJLiveViewController()
@property (nonatomic, strong) IJKFFMoviePlayerController *player;
@property (nonatomic, strong) UIView *topVedioView;
@property (nonatomic, strong) LJLiveAnchorView *middleAnchorView;
@property (nonatomic, strong) LJLiveChatView *bottomChatView;
@property (nonatomic, strong) LJLiveTextView *liveTextView;
@end

@implementation LJLiveViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self setupVideoPlayer];
    
//    [self requsetRoomInfo];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    _topVedioView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, DeviceWidth, DeviceWidth * 9 / 16)];
    _topVedioView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_topVedioView];
    
    _middleAnchorView = [[LJLiveAnchorView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topVedioView.frame), DeviceWidth, 80)];
    _middleAnchorView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_middleAnchorView];
    
    _bottomChatView = [[LJLiveChatView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_middleAnchorView.frame), DeviceWidth, DeviceHeight - CGRectGetMaxY(_middleAnchorView.frame) - 50)];
    _bottomChatView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_bottomChatView];
    
    _liveTextView = [[LJLiveTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bottomChatView.frame), DeviceWidth, 50)];
    _liveTextView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_liveTextView];
}

- (void)setupVideoPlayer {
    NSURL *url = [NSURL URLWithString:self.linkObject.title];
//    NSURL *url = [NSURL URLWithString:@"http://pull99.a8.com/live/1473743094231643.flv"];
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    [playerVc prepareToPlay];
    _player = playerVc;
    playerVc.view.frame = DeviceRect;
    [self.view addSubview:playerVc.view];
}

- (void)requsetRoomInfo {
    NSString *url = [NSString stringWithFormat:@"http://www.quanmin.tv/json/rooms/%@/info.json?1473746509", self.linkObject.uid];
    [LJNetWorkingTools GET:url params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [_player pause];
//    [_player stop];
}


@end
