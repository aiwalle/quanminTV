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
#import "LJMainSectioView.h"
#import "LJRecommendCell.h"
#import "LJRecommendCollectionView.h"
#import "LJLiveViewController.h"

#import "LJMainListModel.h"
#import "LJMainRecommendModel.h"
#import "LJMainGamesModel.h"
@interface LJMainViewController()<UITableViewDataSource, UITableViewDelegate, LJCycleScrollViewDelegate, LJGamesCollectionViewDelegate, LJRecommendCollectionViewDelegate>
@property (nonatomic, strong) LJCycleScrollView *cycleScrollView;
@property (nonatomic, strong) LJGamesCollectionView *gamesColletionV;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIView *headerContainerV;
@property (nonatomic, strong) NSMutableDictionary *allDataArr;
@property (nonatomic, strong) NSMutableArray *mainListArr;
@property (nonatomic, strong) NSMutableArray *bannerArr;
@property (nonatomic, strong) NSMutableArray *bannerGamesArr;
@property (nonatomic, strong) NSMutableArray *recommendLivingArr;
@end

@implementation LJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTitleLogoView];
    [self.view addSubview:self.mainTableView];
    
    [self requestNetWorking];
}

- (void)setupTitleLogoView {
    UIImageView *titleIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 93, 44)];
//    titleIV.image = [UIImage imageNamed:@"nav_image"];
    self.navigationItem.titleView = titleIV;
}

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.dataSource = self;
        _mainTableView.delegate = self;
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        [self setupBannerView];
        [self setupGamesCollectionView];
    }
    return _mainTableView;
}

- (void)requestNetWorking {
    [LJNetWorkingTools GET:@"http://www.quanmin.tv/json/page/appv2-index/info.json?1473646855" params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        // 先保存所有的数据
        self.allDataArr = [NSMutableDictionary dictionary];
        self.allDataArr = responseObject;
        // 首页的结构数据
        self.mainListArr = [NSMutableArray array];
        NSArray *listArr = [responseObject objectForKey:@"list"];
        for (int i = 0; i < listArr.count; i++) {
            LJMainListModel *listModel = [[LJMainListModel alloc] initWithDictionary:listArr[i]];
            [self.mainListArr addObject:listModel];
        }
        // 获取banner信息
//        [self setupBannerDataWithResponseObject:responseObject];
        // 获取直播栏目的信息
//        [self setupBannerGamesWithResponseObject:responseObject];
        [self.mainTableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)setupBannerGamesWithResponseObject:(id)responseObject {
    self.bannerGamesArr = [NSMutableArray array];
    LJMainListModel *gamesModel = [self.mainListArr objectAtIndex:1];
    NSArray *gamesArr = responseObject[gamesModel.slug];
    for (NSDictionary *gamesObject in gamesArr) {
        LJMainGamesModel *gameModel = [[LJMainGamesModel alloc] initWithDictionary:gamesObject];
        [self.bannerGamesArr addObject:gameModel];
    }
    self.gamesColletionV.gamesArr = self.bannerGamesArr;
}

- (void)setupBannerDataWithResponseObject:(id)responseObject{
    NSMutableArray *bannerImages = [NSMutableArray array];
    NSMutableArray *bannerTitles = [NSMutableArray array];
    self.bannerArr = [NSMutableArray array];
    LJMainListModel *bannerModel = self.mainListArr.firstObject;
    NSArray *bannerArr = responseObject[bannerModel.slug];
    for (NSDictionary *bannerObject in bannerArr) {
        if ([[bannerObject allKeys] containsObject:@"title"]) {
            [bannerTitles addObject:[bannerObject objectForKey:@"title"]];
        }else {
            [bannerTitles addObject:[[bannerObject objectForKey:@"link_object"] objectForKey:@"title"]];
        }
        if ([[bannerObject allKeys] containsObject:@"thumb"]) {
            [bannerImages addObject:[bannerObject objectForKey:@"thumb"]];
        }else {
            [bannerImages addObject:[[bannerObject objectForKey:@"link_object"] objectForKey:@"thumb"]];
        }
        LJMainRecommendModel *bannerModel = [[LJMainRecommendModel alloc] initWithDictionary:bannerObject];
        [self.bannerArr addObject:bannerModel];
    }
    _cycleScrollView.imageURLStringsGroup = bannerImages;
    _cycleScrollView.titlesGroup = bannerTitles;
}

- (void)setupBannerView {
    UIView *headerContainerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 290)];
    _headerContainerV = headerContainerV;
    LJCycleScrollView *cycleScrollView = [LJCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, DeviceWidth, 180) delegate:self placeholderImage:[UIImage imageNamed:@"normal_100"]];
    _cycleScrollView = cycleScrollView;
    [_headerContainerV addSubview:cycleScrollView];
}

- (void)setupGamesCollectionView {
    LJGamesCollectionView *gamesColletionV = [[LJGamesCollectionView alloc] initWithFrame:CGRectMake(0, 180, DeviceWidth, 80)];
    _gamesColletionV = gamesColletionV;
    gamesColletionV.delegate = self;
    [_headerContainerV addSubview:gamesColletionV];
    _mainTableView.tableHeaderView = _headerContainerV;
}

#pragma mark - **************** UICollectionViewDelegate
- (void)cycleScrollView:(LJCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    LJBannerViewController *bannerVC = [[LJBannerViewController alloc] init];
    [self.navigationController pushViewController:bannerVC animated:YES];
}

- (void)gamesCollectionView:(LJGamesCollectionView *)gamesCollectionView didSelectItemAtIndex:(NSInteger)index {
    LJColumnListController *columnVC = [[LJColumnListController alloc] init];
    [self.navigationController pushViewController:columnVC animated:YES];
}

- (void)recommendCollectionView:(LJRecommendCollectionView *)recommendCollectionView didSelectItemAtIndex:(NSInteger)index {
    LJLiveViewController *liveVC = [[LJLiveViewController alloc] init];
    [self.navigationController pushViewController:liveVC animated:YES];
}

#pragma mark - **************** UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mainListArr.count ? self.mainListArr.count - 3 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJRecommendCell *cell = [LJRecommendCell cellWithTableView:tableView];
    cell.recommendCollevtionV.delegate = self;
    LJMainListModel *listModel = self.mainListArr[indexPath.section + 2];
    NSMutableArray *recommendArr = self.allDataArr[listModel.slug];
    cell.recommendCollevtionV.recommendArr = recommendArr;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LJMainSectioView *sectionV = [[LJMainSectioView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, 20)];
    return sectionV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
@end
