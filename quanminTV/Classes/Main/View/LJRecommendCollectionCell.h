//
//  LJRecommendCollectionCell.h
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJMainRecommendModel;
@interface LJRecommendCollectionCell : UICollectionViewCell
@property (nonatomic, strong) LJMainRecommendModel *recommendModel;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
