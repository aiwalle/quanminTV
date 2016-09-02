//
//  LJMainViewController.m
//  quanminTV
//
//  Created by liang on 16/8/31.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJMainViewController.h"
#import "LJCycleScrollView.h"
#import "LJBannerViewController.h"
#import "LJGamesCollectionView.h"
#import "LJColumnListController.h"
@interface LJMainViewController()<UITableViewDataSource, UITableViewDelegate, LJCycleScrollViewDelegate, LJGamesCollectionViewDelegate>
@property (nonatomic, strong) NSArray *imagesURLStrings;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIView *headerContainerV;
@end

@implementation LJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTitleLogoView];
    [self.view addSubview:self.mainTableView];
    
    
}

- (void)setupTitleLogoView {
    UIImageView *titleIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 93, 44)];
//    titleIV.image = [UIImage imageNamed:@"nav_image"];
    self.navigationItem.titleView = titleIV;
}

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        [self setupBannerView];
        [self setupGamesCollectionView];
    }
    return _mainTableView;
}

- (void)setupBannerView {
    UIView *headerContainerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 300)];
    _headerContainerV = headerContainerV;
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    NSArray *titles = @[@"我是图片的文字11111 ",
                        @"我是图片的文字22222",
                        @"我是图片的文字33333",
                        @"我是图片的文字44444"
                        ];
    
    LJCycleScrollView *cycleScrollView = [LJCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, DeviceWidth, 180) delegate:self placeholderImage:[UIImage imageNamed:@"normal_100"]];
    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView.titlesGroup = titles;
    [_headerContainerV addSubview:cycleScrollView];
}

- (void)setupGamesCollectionView {
    LJGamesCollectionView *gamesColletionV = [[LJGamesCollectionView alloc] initWithFrame:CGRectMake(0, 180, DeviceWidth, 100)];
    gamesColletionV.delegate = self;
    [_headerContainerV addSubview:gamesColletionV];
    _mainTableView.tableHeaderView = _headerContainerV;
}

- (void)cycleScrollView:(LJCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    LJBannerViewController *bannerVC = [[LJBannerViewController alloc] init];
    bannerVC.urlString = _imagesURLStrings[index];
    [self.navigationController pushViewController:bannerVC animated:YES];
}

- (void)gamesCollectionView:(LJGamesCollectionView *)gamesCollectionView didSelectItemAtIndex:(NSInteger)index {
    LJColumnListController *columnVC = [[LJColumnListController alloc] init];
    [self.navigationController pushViewController:columnVC animated:YES];
}

#pragma mark - **************** UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

static NSString * const CellId = @"CellId";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}
@end
