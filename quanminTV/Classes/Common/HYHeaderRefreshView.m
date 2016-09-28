//
//  HYHeaderRefreshView.m
//  Mall
//
//  Created by 双泉 朱 on 16/4/21.
//  Copyright © 2016年 _Zhizi_. All rights reserved.
//

#import "HYHeaderRefreshView.h"
@interface HYHeaderRefreshView ()

@property (nonatomic,strong) UILabel * headerRefLabel;

@end

@implementation HYHeaderRefreshView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
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

- (UIImageView *)headerRefStaticImageView {
    
    if (!_headerRefStaticImageView) {
        _headerRefStaticImageView = [UIImageView new];
        _headerRefStaticImageView.image = [UIImage imageNamed:@"下拉刷新10001"];
    }
    return _headerRefStaticImageView;
}

- (UIImageView *)headerRefImageView {
    
    if (!_headerRefImageView) {
        _headerRefImageView = [UIImageView new];
        NSMutableArray * arrM = @[].mutableCopy;
        for (int i = 1; i < 38; i+=2) {
            [arrM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"下拉刷新100%.2i",i]]];
        }
        _headerRefImageView.animationImages = arrM;
        _headerRefImageView.animationDuration = 1.5;
        _headerRefImageView.animationRepeatCount = MAXFLOAT;
    }
    return _headerRefImageView;
}

- (UILabel *)headerRefLabel {
    
    if (!_headerRefLabel) {
        _headerRefLabel = [UILabel new];
        _headerRefLabel.textAlignment = NSTextAlignmentCenter;
        _headerRefLabel.text = @"华润健一网 · 100%正品保证";
        _headerRefLabel.textColor = [UIColor blackColor];
        _headerRefLabel.font = themeFont(12);
    }
    return _headerRefLabel;
}


- (void)setupSubviews {
    self.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.headerRefStaticImageView];
    [self addSubview:self.headerRefImageView];
    [self addSubview:self.headerRefLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat headerRefLabelH = 30;
    CGFloat headerRefLabelX = 0;
    CGFloat headerRefLabelY = self.height - headerRefLabelH;
    CGFloat headerRefLabelW = DeviceWidth;
    self.headerRefLabel.frame = CGRectMake(headerRefLabelX, headerRefLabelY, headerRefLabelW, headerRefLabelH);

    CGFloat headerRefImageViewW = 160;
    CGFloat headerRefImageViewH = 80;
    CGFloat headerRefImageViewX = (DeviceWidth - headerRefImageViewW) * 0.5f;
    CGFloat headerRefImageViewY = headerRefLabelY - headerRefImageViewH;
    self.headerRefStaticImageView.frame = self.headerRefImageView.frame = CGRectMake(headerRefImageViewX, headerRefImageViewY, headerRefImageViewW, headerRefImageViewH);
    
}


@end
