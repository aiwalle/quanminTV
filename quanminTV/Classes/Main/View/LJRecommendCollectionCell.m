//
//  LJRecommendCollectionCell.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJRecommendCollectionCell.h"

@implementation LJRecommendCollectionCell
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    LJRecommendCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LJRecommendCollectionCell class]) forIndexPath:indexPath];
    [cell setupSubviews];
    return cell;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor purpleColor];
}
@end
