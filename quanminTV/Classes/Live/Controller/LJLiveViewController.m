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
@property (nonatomic, strong) NSMutableDictionary *liveInfoDic;
@end

@implementation LJLiveViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"直播";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubviews];
    
    [self requsetRoomInfo];
}

- (void)setupSubviews {
    _topVedioView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, DeviceWidth, DeviceWidth * 9 / 16)];
    _topVedioView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_topVedioView];
    
    _middleAnchorView = [[LJLiveAnchorView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topVedioView.frame), DeviceWidth, 60)];
    [self.view addSubview:_middleAnchorView];
    
    _bottomChatView = [[LJLiveChatView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_middleAnchorView.frame), DeviceWidth, DeviceHeight - CGRectGetMaxY(_middleAnchorView.frame) - 50)];
    _bottomChatView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_bottomChatView];
    
    _liveTextView = [[LJLiveTextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bottomChatView.frame), DeviceWidth, 50)];
    [self.view addSubview:_liveTextView];
}

- (void)requsetRoomInfo {
    NSString *url = [NSString stringWithFormat:@"http://www.quanmin.tv/json/rooms/%@/info.json?1473746509", self.linkObject.uid];
    [LJNetWorkingTools GET:url params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
//        [self setupVideoPlayerWithResponseObject:responseObject];
//        [self setupViewsDataWithResponseObject:responseObject];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)setupVideoPlayerWithResponseObject:(id)responseObject {
    NSString *urlString = [[[[[responseObject valueForKey:@"live"] valueForKey:@"ws"] valueForKey:@"flv"] valueForKey:@"0"] valueForKey:@"src"];
    NSURL *url = [NSURL URLWithString:urlString];
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    [playerVc prepareToPlay];
    _player = playerVc;
    playerVc.view.frame = _topVedioView.bounds;
    [_topVedioView addSubview:playerVc.view];
}

- (void)setupViewsDataWithResponseObject:(id)responseObject {
    [self.middleAnchorView configIconUrl:[responseObject valueForKey:@"avatar"] nameTitle:[responseObject valueForKey:@"nick"] signTitle:[responseObject valueForKey:@"title"]];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_player pause];
    [_player stop];
}


@end
