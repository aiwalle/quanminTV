//
//  LJRecommendCell.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJRecommendCell.h"
#import "LJRecommendCollectionView.h"

@interface LJRecommendCell()

@end
@implementation LJRecommendCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    NSString * identifier = NSStringFromClass([LJRecommendCell class]);
    LJRecommendCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[LJRecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.recommendCollevtionV];
}

- (LJRecommendCollectionView *)recommendCollevtionV {
    if (!_recommendCollevtionV) {
        _recommendCollevtionV = [[LJRecommendCollectionView alloc] init];
        
    }
    return _recommendCollevtionV;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat collectX = 10;
    CGFloat collectY = 0;
    CGFloat collectW = self.width - collectX * 2;
    CGFloat collectH = self.height;
    _recommendCollevtionV.frame = CGRectMake(collectX, collectY, collectW, collectH);
}

@end
