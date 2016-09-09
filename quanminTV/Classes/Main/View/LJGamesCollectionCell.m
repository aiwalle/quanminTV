//
//  LJGamesCollectionCell.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJGamesCollectionCell.h"

@interface LJGamesCollectionCell()
@property (nonatomic, strong) UIImageView *iconIV;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation LJGamesCollectionCell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    LJGamesCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LJGamesCollectionCell class]) forIndexPath:indexPath];
    [cell setupSubviews];
    return cell;
}

- (void)setupSubviews {
    [self addSubview:self.iconIV];
    [self addSubview:self.titleLabel];
}

- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc] init];
//        _iconIV.backgroundColor = [UIColor redColor];
        _iconIV.image = [UIImage circleImageNamed:@"logisticicon"];
    }
    return _iconIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.backgroundColor = [UIColor blueColor];
        _titleLabel.text = @"英雄联盟";
        _titleLabel.font = themeFont12;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconIVX = 5;
    CGFloat iconIVY = 5;
    CGFloat iconIVW = self.width - iconIVX * 2;
    CGFloat iconIVH = self.height - 30;
    _iconIV.frame = CGRectMake(iconIVX, iconIVY, iconIVW, iconIVH);
    
    CGFloat titleX = 0;
    CGFloat titleH = 30;
    CGFloat titleY = self.height - titleH;
    CGFloat titleW = self.width;
    _titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

@end
