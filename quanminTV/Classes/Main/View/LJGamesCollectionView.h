//
//  LJGamesCollectionView.h
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJGamesCollectionView;
@protocol LJGamesCollectionViewDelegate <NSObject>

@optional


- (void)gamesCollectionView:(LJGamesCollectionView *)gamesCollectionView didSelectItemAtIndex:(NSInteger)index;

@end
@interface LJGamesCollectionView : UIView
@property (nonatomic, weak) id<LJGamesCollectionViewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *gamesArr;
@end
