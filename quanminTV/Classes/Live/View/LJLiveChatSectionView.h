//
//  LJLiveChatSectionView.h
//  quanminTV
//
//  Created by liang on 16/9/13.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJLiveChatSectionView;
@protocol LJLiveChatSectionViewDelegate <NSObject>

- (void)liveChatView:(LJLiveChatSectionView *)liveChatView didSelectedButtonWithIndex:(NSUInteger)index;

@end
@interface LJLiveChatSectionView : UIView
@property (nonatomic, weak) id<LJLiveChatSectionViewDelegate> delegate;
@end
