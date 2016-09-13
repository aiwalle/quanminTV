//
//  LJRecommendCollectionCell.h
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJMainLinkObject;
@interface LJRecommendCollectionCell : UICollectionViewCell
@property (nonatomic, strong) LJMainLinkObject *linkObject;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
