//
//  LJLiveAnchorView.m
//  quanminTV
//
//  Created by liang on 16/9/13.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJLiveAnchorView.h"
//#import "UIImageView+WebCache.h"
@interface LJLiveAnchorView()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signLabel;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UISwitch *remindSwitch;
@property (nonatomic, strong) UILabel *switchBottomLabel;
@property (nonatomic, strong) UIView *lineView;
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
    
    _nameLabel = [[UILabel alloc] init];
    [self addSubview:_nameLabel];
    _nameLabel.textColor = [UIColor darkGrayColor];
    _nameLabel.font = themeFont14;
    
    _signLabel = [[UILabel alloc] init];
    [self addSubview:_signLabel];
    _signLabel.textColor = [UIColor lightGrayColor];
    _signLabel.font = themeFont12;
    
    _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_likeBtn setBackgroundImage:[UIImage imageNamed:@"focus"] forState:UIControlStateNormal];
    [_likeBtn.titleLabel setFont:themeFont10];
    [_likeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self addSubview:_likeBtn];
    
    _remindSwitch = [[UISwitch alloc] init];
    [self addSubview:_remindSwitch];
    
    _switchBottomLabel = [[UILabel alloc] init];
    _switchBottomLabel.text = @"开播提醒";
    _switchBottomLabel.textColor = [UIColor lightGrayColor];
    _switchBottomLabel.font = themeFont10;
    [self addSubview:_switchBottomLabel];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:_lineView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconX = 10;
    CGFloat iconY = 10;
    CGFloat iconW = self.height - iconY * 2;
    CGFloat iconH = iconW;
    _iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    _iconImageView.layer.cornerRadius = iconW * 0.5;
    _iconImageView.layer.masksToBounds = YES;
    
    CGFloat nameX = CGRectGetMaxX(_iconImageView.frame) + 10;
    CGFloat nameY = iconY;
    CGFloat nameW = 100;
    CGFloat nameH = 21;
    _nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat signX = nameX;
    CGFloat signH = nameH;
    CGFloat signY = iconH + iconY - signH;
    CGFloat signW = 150;
    _signLabel.frame = CGRectMake(signX, signY, signW, signH);
    
    CGFloat switchX = self.width - 10 - 51;
    CGFloat switchY = iconY;
    CGFloat switchW = 51;
    CGFloat switchH = 31;
    _remindSwitch.frame = CGRectMake(switchX, switchY, switchW, switchH);
    _remindSwitch.transform = CGAffineTransformMakeScale( .75, .75);
    
    CGFloat switchLabelX = switchX;
    CGFloat switchLabelY = switchY + switchH * 0.75 + 10;
    CGFloat switchLabelW = switchW;
    CGFloat switchLabelH = 12;
    _switchBottomLabel.frame = CGRectMake(switchLabelX, switchLabelY, switchLabelW, switchLabelH);
    _switchBottomLabel.centerX = _remindSwitch.centerX;
    _switchBottomLabel.bottom = _signLabel.bottom;
    
    CGFloat likeBtnX = switchLabelX - iconW - 10;
    CGFloat likeBtnY = iconY;
    CGFloat likeBtnW = iconW * 0.6;
    CGFloat likeBtnH = likeBtnW;
    _likeBtn.frame = CGRectMake(likeBtnX, likeBtnY, likeBtnW, likeBtnH);
    
    CGFloat lineX = 0;
    CGFloat lineH = 0.3;
    CGFloat lineY = self.height - lineH;
    CGFloat lineW = self.width;
    _lineView.frame = CGRectMake(lineX, lineY, lineW, lineH);
}

- (void)configIconUrl:(NSString *)iconUrl nameTitle:(NSString *)name signTitle:(NSString *)sign {
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@"normal_100"]];
    _nameLabel.text = name;
    _signLabel.text = sign;
}

@end
