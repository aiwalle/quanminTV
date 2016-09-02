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
        _iconIV.backgroundColor = [UIColor redColor];
    }
    return _iconIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor blueColor];
    }
    return _titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconIVX = 0;
    CGFloat iconIVY = 0;
    CGFloat iconIVW = self.width;
    CGFloat iconIVH = self.height - 20;
    _iconIV.frame = CGRectMake(iconIVX, iconIVY, iconIVW, iconIVH);
    
    CGFloat titleX = 0;
    CGFloat titleY = iconIVH;
    CGFloat titleW = self.width;
    CGFloat titleH = 20;
    _titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
}

@end