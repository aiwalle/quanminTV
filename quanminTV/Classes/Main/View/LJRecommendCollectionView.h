//
//  LJRecommendCollectionView.h
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJRecommendCollectionView;
@protocol LJRecommendCollectionViewDelegate <NSObject>
@optional
- (void)recommendCollectionView:(LJRecommendCollectionView *)recommendCollectionView didSelectItemAtIndex:(NSInteger)index;

@end

@interface LJRecommendCollectionView : UIView
@property (nonatomic, weak) id<LJRecommendCollectionViewDelegate> delegate;
@property (nonatomic, assign) BOOL isLivingController;
@end
