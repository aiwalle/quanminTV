//
//  LJMainViewController.m
//  quanminTV
//
//  Created by liang on 16/8/31.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJMainViewController.h"
#import "LJCycleScrollView.h"
@interface LJMainViewController()<LJCycleScrollViewDelegate>

@end

@implementation LJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTitleLogoView];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:0.99];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"005.jpg"]];
    backgroundView.frame = self.view.bounds;
    [self.view addSubview:backgroundView];
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:demoContainerView];
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 情景三：图片配文字
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com"
                        ];
    
    
    CGFloat w = self.view.bounds.size.width;
    
    LJCycleScrollView *cycleScrollView = [LJCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, w, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView.backgroundColor = [UIColor redColor];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView.titlesGroup = titles;
    [demoContainerView addSubview:cycleScrollView];
    
}

- (void)setupTitleLogoView {
    UIImageView *titleIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 93, 44)];
    titleIV.image = [UIImage imageNamed:@"nav_image"];
    self.navigationItem.titleView = titleIV;
}

@end