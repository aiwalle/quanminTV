//
//  LJCycleScrollView.h
//  quanminTV
//
//  Created by liang on 16/9/1.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJCycleScrollView;
@protocol LJCycleScrollViewDelegate <NSObject>

@optional

/** 点击图片回调 */
- (void)cycleScrollView:(LJCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

@end


@interface LJCycleScrollView : UIView
/** 自动滚动间隔时间,默认2s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

/** 轮播文字label字体颜色 */
@property (nonatomic, strong) UIColor *titleLabelTextColor;
/** 轮播文字label字体大小 */
@property (nonatomic, strong) UIFont  *titleLabelTextFont;
/** 轮播文字label背景颜色 */
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
/** 轮播文字label高度 */
@property (nonatomic, assign) CGFloat titleLabelHeight;
/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;
/** 占位图，用于网络未加载到图片时 */
@property (nonatomic, strong) UIImage *placeholderImage;
/** 是否自动滚动,默认Yes */
@property (nonatomic,assign) BOOL autoScroll;

/** 网络图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;

/** 每张图片对应要显示的文字数组 */
@property (nonatomic, strong) NSArray *titlesGroup;

@property (nonatomic, weak) id<LJCycleScrollViewDelegate> delegate;

+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<LJCycleScrollViewDelegate>)delegate placeholderImage:(UIImage *)placeholderImage;
@end
