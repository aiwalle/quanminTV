//
//  LJLivingListController.m
//  quanminTV
//
//  Created by liang on 16/9/9.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJLivingListController.h"
#import "LJRecommendCollectionView.h"
#import "LJLiveViewController.h"
@interface LJLivingListController ()<LJRecommendCollectionViewDelegate>
@property (nonatomic, strong) LJRecommendCollectionView *recommendCollV;

@end

@implementation LJLivingListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.recommendCollV];
}

- (LJRecommendCollectionView *)recommendCollV {
    if (!_recommendCollV) {
        _recommendCollV = [[LJRecommendCollectionView alloc] initWithFrame:CGRectMake(10, 10, DeviceWidth - 20, DeviceHeight - 20)];
        _recommendCollV.isLivingController = YES;
        _recommendCollV.delegate = self;
    }
    return _recommendCollV;
}

- (void)recommendCollectionView:(LJRecommendCollectionView *)recommendCollectionView didSelectItemAtIndex:(NSInteger)index {
    LJLiveViewController *liveVC = [[LJLiveViewController alloc] init];
    [self.navigationController pushViewController:liveVC animated:YES];
}

@end
