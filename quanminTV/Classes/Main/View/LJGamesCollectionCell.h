//
//  LJGamesCollectionCell.h
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJMainGamesModel;
@interface LJGamesCollectionCell : UICollectionViewCell
@property (nonatomic, strong) LJMainGamesModel *gamesModel;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
