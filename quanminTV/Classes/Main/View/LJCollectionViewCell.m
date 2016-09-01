//
//  LJCollectionViewCell.m
//  quanminTV
//
//  Created by liang on 16/9/1.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJCollectionViewCell.h"

@interface LJCollectionViewCell()
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation LJCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setupTitleLabel];
    }
    return self;
}

- (void)setTitleLabelBackgroundColor:(UIColor *)titleLabelBackgroundColor
{
    _titleLabelBackgroundColor = titleLabelBackgroundColor;
    _titleLabel.backgroundColor = titleLabelBackgroundColor;
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor
{
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = titleLabelTextColor;
}

- (void)setTitleLabelTextFont:(UIFont *)titleLabelTextFont
{
    _titleLabelTextFont = titleLabelTextFont;
    _titleLabel.font = titleLabelTextFont;
}

- (void)setupImageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    [self.contentView addSubview:imageView];
}

- (void)setupTitleLabel {
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    _titleLabel.hidden = YES;
    [self.contentView addSubview:titleLabel];
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
    _titleLabel.text = [NSString stringWithFormat:@"   %@", title];
    if (_titleLabel.hidden) {
        _titleLabel.hidden = NO;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _imageView.frame = self.bounds;
    CGFloat titleLabelW = self.width;
    CGFloat titleLabelH = _titleLabelHeight;
    CGFloat titleLabelX = 0;
    CGFloat titleLabelY = self.height - titleLabelH;
    _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
}
@end