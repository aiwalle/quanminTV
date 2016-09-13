//
//  LJLiveChatView.m
//  quanminTV
//
//  Created by liang on 16/9/13.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJLiveChatView.h"
#import "LJLiveChatSectionView.h"
@interface LJLiveChatView()<LJLiveChatSectionViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) LJLiveChatSectionView *sectionView;
@property (nonatomic, strong) UITableView *chatTableView;
@property (nonatomic, strong) UITableView *rankTableView;
@end

@implementation LJLiveChatView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder  {
    
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (LJLiveChatSectionView *)sectionView {
    if (!_sectionView) {
        _sectionView = [[LJLiveChatSectionView alloc] init];
        _sectionView.delegate = self;
    }
    return _sectionView;
}

- (UITableView *)chatTableView {
    if (!_chatTableView) {
        _chatTableView = [[UITableView alloc] init];
        _chatTableView.backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1.00];
        _chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _chatTableView.dataSource = self;
        _chatTableView.delegate = self;
    }
    return _chatTableView;
}

- (UITableView *)rankTableView {
    if (!_rankTableView) {
        _rankTableView = [[UITableView alloc] init];
        _rankTableView.backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1.00];
        _rankTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _rankTableView.dataSource = self;
        _rankTableView.delegate = self;
    }
    return _rankTableView;
}

- (void)setupSubviews {
    [self addSubview:self.sectionView];
    [self addSubview:self.chatTableView];
    [self addSubview:self.rankTableView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat sectionX = 0;
    CGFloat sectionY = 0;
    CGFloat sectionW = DeviceWidth;
    CGFloat sectionH = 44;
    _sectionView.frame = CGRectMake(sectionX, sectionY, sectionW, sectionH);
    
    CGFloat chatX = 0;
    CGFloat chatY = CGRectGetMaxY(_sectionView.frame);
    CGFloat chatW = DeviceWidth;
    CGFloat chatH = self.height - sectionH;
    _chatTableView.frame = CGRectMake(chatX, chatY, chatW, chatH);
    
    CGFloat rankX = chatX;
    CGFloat rankY = chatY;
    CGFloat rankW = chatW;
    CGFloat rankH = chatH;
    _rankTableView.frame = CGRectMake(rankX, rankY, rankW, rankH);
}

#pragma mark - **************** UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

static NSString * const CellId = @"CellId";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.backgroundColor = [UIColor colorWithRed:0.973 green:0.973 blue:0.973 alpha:1.00];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

#pragma mark - **************** LJLiveChatSectionViewDelegate
- (void)liveChatView:(LJLiveChatSectionView *)liveChatView didSelectedButtonWithIndex:(NSUInteger)index {
    if (index) {
        _rankTableView.hidden = NO;
        _chatTableView.hidden = YES;
    }else {
        _rankTableView.hidden = YES;
        _chatTableView.hidden = NO;
    }
}

@end