//
//  LJLiveAnchorView.m
//  quanminTV
//
//  Created by liang on 16/9/13.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJLiveAnchorView.h"

@interface LJLiveAnchorView()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signLabel;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UISwitch *remindSwitch;
@property (nonatomic, strong) UILabel *switchBottomLabel;
@end

@implementation LJLiveAnchorView
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

- (void)setupSubviews {
    _iconImageView = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
    _iconImageView.backgroundColor = [UIColor redColor];
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    _nameLabel.backgroundColor = [UIColor lightGrayColor];
    
    _signLabel = [[UILabel alloc] init];
    [self addSubview:_signLabel];
    _signLabel.backgroundColor = [UIColor purpleColor];
    
    _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_likeBtn];
    [_likeBtn setBackgroundColor:[UIColor blueColor]];
    
    _remindSwitch = [[UISwitch alloc] init];
    [self addSubview:_remindSwitch];
    
    _switchBottomLabel = [[UILabel alloc] init];
    [self addSubview:_switchBottomLabel];
    _switchBottomLabel.backgroundColor = [UIColor greenColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconX = 10;
    CGFloat iconY = 10;
    CGFloat iconW = self.height - iconY * 2;
    CGFloat iconH = iconW;
    _iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat nameX = CGRectGetMaxX(_iconImageView.frame) + 10;
    CGFloat nameY = iconY;
    CGFloat nameW = 100;
    CGFloat nameH = 21;
    _nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat signX = nameX;
    CGFloat signY = CGRectGetMaxY(_nameLabel.frame) + 10;
    CGFloat signW = 200;
    CGFloat signH = nameH;
    _signLabel.frame = CGRectMake(signX, signY, signW, signH);
    
    CGFloat switchX = self.width - 10 - 51;
    CGFloat switchY = iconY;
    CGFloat switchW = 51;
    CGFloat switchH = 31;
    _remindSwitch.frame = CGRectMake(switchX, switchY, switchW, switchH);
    
    
}

@end
