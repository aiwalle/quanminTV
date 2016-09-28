//
//  LJRefreshHeader.m
//  quanminTV
//
//  Created by liang on 16/9/19.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJRefreshHeader.h"
#import "HYHeaderRefreshView.h"
@interface LJRefreshHeader()
@property (nonatomic, strong) HYHeaderRefreshView *headerRef;
@end

@implementation LJRefreshHeader
- (void)prepare
{
    [super prepare];
    self.backgroundColor = [UIColor lightGrayColor];
    // 设置控件的高度
    self.mj_h = 110;
    
    HYHeaderRefreshView * headerRef = [[HYHeaderRefreshView alloc] init];
    [self addSubview:headerRef];
    _headerRef = headerRef;
    
    // 添加label
//    UILabel *label = [[UILabel alloc] init];
//    label.textColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
//    label.font = [UIFont boldSystemFontOfSize:16];
//    label.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:label];
//    self.label = label;
//    
//    // 打酱油的开关
//    UISwitch *s = [[UISwitch alloc] init];
//    [self addSubview:s];
//    self.s = s;
//    
//    // logo
//    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
//    logo.contentMode = UIViewContentModeScaleAspectFit;
//    [self addSubview:logo];
//    self.logo = logo;
//    
//    // loading
//    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    [self addSubview:loading];
//    self.loading = loading;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.headerRef.frame = self.bounds;
    
    
//    self.label.frame = self.bounds;
//    
//    self.logo.bounds = CGRectMake(0, 0, self.bounds.size.width, 100);
//    self.logo.center = CGPointMake(self.mj_w * 0.5, - self.logo.mj_h + 20);
//    
//    self.loading.center = CGPointMake(self.mj_w - 30, self.mj_h * 0.5);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
//            [self.loading stopAnimating];
//            [self.s setOn:NO animated:YES];
//            self.label.text = @"赶紧下拉吖(开关是打酱油滴)";
            
            [self.headerRef.headerRefImageView stopAnimating];
            [self.headerRef.headerRefStaticImageView setHidden:NO];
            break;
        case MJRefreshStatePulling:
//            [self.loading stopAnimating];
//            [self.s setOn:YES animated:YES];
//            self.label.text = @"赶紧放开我吧(开关是打酱油滴)";
            break;
        case MJRefreshStateRefreshing:
//            [self.s setOn:YES animated:YES];
//            self.label.text = @"加载数据中(开关是打酱油滴)";
//            [self.loading startAnimating];
            
            [self.headerRef.headerRefStaticImageView setHidden:YES];
            [self.headerRef.headerRefImageView startAnimating];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
}

@end
