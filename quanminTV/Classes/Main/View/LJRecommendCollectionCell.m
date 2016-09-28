//
//  LJRecommendCollectionCell.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJRecommendCollectionCell.h"
#import "LJMainLinkObject.h"
@interface LJRecommendCollectionCell()
@property (nonatomic, strong) UIImageView *itemImageView;
@property (nonatomic, strong) UILabel *peopleCountLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *signLabel;
@end
@implementation LJRecommendCollectionCell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    LJRecommendCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LJRecommendCollectionCell class]) forIndexPath:indexPath];
    [cell setupSubviews];
    return cell;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.itemImageView];
    [self addSubview:self.peopleCountLabel];
    [self addSubview:self.iconImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.signLabel];
}

- (UIImageView *)itemImageView {
    if (!_itemImageView) {
        _itemImageView = [[UIImageView alloc] init];
//        _itemImageView.backgroundColor = [UIColor blueColor];
        _itemImageView.image = [UIImage imageNamed:@"normal_100"];
    }
    return _itemImageView;
}

- (UILabel *)peopleCountLabel {
    if (!_peopleCountLabel) {
        _peopleCountLabel = [[UILabel alloc] init];
//        _peopleCountLabel.backgroundColor = [UIColor redColor];
        _peopleCountLabel.text = @"▶ 3.2万";
        _peopleCountLabel.font = themeFont10;
    }
    return _peopleCountLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
//        _iconImageView.backgroundColor = [UIColor greenColor];
//        _iconImageView.image = [UIImage imageNamed:@"doc_touxiang"];
        
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
//        _nameLabel.backgroundColor = [UIColor brownColor];
//        _nameLabel.text = @"猪头123";
        _nameLabel.font = themeFont12;
    }
    return _nameLabel;
}

- (UILabel *)signLabel {
    if (!_signLabel) {
        _signLabel = [[UILabel alloc] init];
//        _signLabel.backgroundColor = [UIColor greenColor];
//        _signLabel.text = @"八戒，别追了";
        _signLabel.font = themeFont10;
    }
    return _signLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat itemImageX = 0;
    CGFloat itemImageY = 0;
    CGFloat itemImageW = self.width;
    CGFloat itemImageH = self.height * 2 / 3;
    _itemImageView.frame = CGRectMake(itemImageX, itemImageY, itemImageW, itemImageH);
    _itemImageView.layer.cornerRadius = 5;
    _itemImageView.layer.masksToBounds = YES;
    
    CGFloat countX = 10;
    CGFloat countH = 20;
    CGFloat countY = itemImageH - 8 -20;
    CGFloat countW = 50;
    _peopleCountLabel.frame = CGRectMake(countX, countY, countW, countH);
    
    CGFloat iconImageX = 0;
    CGFloat iconImageY = itemImageH + 10;
    CGFloat iconImageW = 30;
    CGFloat iconImageH = iconImageW;
    _iconImageView.frame = CGRectMake(iconImageX, iconImageY, iconImageW, iconImageH);
    _iconImageView.layer.cornerRadius = iconImageH * 0.5;
    _iconImageView.layer.masksToBounds = YES;
    
    CGFloat nameX = iconImageW + 10;
    CGFloat nameY = iconImageY;
    CGFloat nameW = self.width - iconImageW - 10;
    CGFloat nameH = 17;
    _nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat signX = nameX;
    CGFloat signY = CGRectGetMaxY(_nameLabel.frame);
    CGFloat signW = nameW;
    CGFloat signH = 13;
    _signLabel.frame = CGRectMake(signX, signY, signW, signH);
}

- (void)setLinkObject:(LJMainLinkObject *)linkObject {
//    _linkObject = linkObject;
//    [_itemImageView sd_setImageWithURL:[NSURL URLWithString:linkObject.thumb] placeholderImage:[UIImage imageNamed:@"normal_100"]];
//    if ([linkObject.view integerValue] > 9999) {
//        _peopleCountLabel.text = [NSString stringWithFormat:@"%.1f万人", [linkObject.view floatValue] / 10000];
//    }else {
//        _peopleCountLabel.text = [NSString stringWithFormat:@"%d人", [linkObject.view intValue]];
//    }
//    
//    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:linkObject.avatar] placeholderImage:[UIImage imageNamed:@"normal_100"]];
//    
//    _nameLabel.text = linkObject.nick;
//    _signLabel.text = linkObject.title;
}
@end
