//
//  LJColumnListController.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJColumnListController.h"

@interface LJColumnListController()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *columnCollectionV;
@end
@implementation LJColumnListController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.columnCollectionV];
}


static NSString * const CellId = @"ColumnListCell";
- (UICollectionView *)columnCollectionV {
    if (!_columnCollectionV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.itemSize = CGSizeMake((DeviceWidth - 20 - 20) / 3, 120);
        _columnCollectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 10, DeviceWidth - 20, DeviceHeight - 20) collectionViewLayout:flowLayout];
        _columnCollectionV.backgroundColor = [UIColor whiteColor];
        _columnCollectionV.showsHorizontalScrollIndicator = NO;
        _columnCollectionV.showsVerticalScrollIndicator = NO;
        [_columnCollectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellId];
        _columnCollectionV.dataSource = self;
        _columnCollectionV.delegate = self;
    }
    return _columnCollectionV;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {        return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellId forIndexPath:indexPath];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:cell.bounds];
    imageV.image = [UIImage imageNamed:@"app_start_4"];
    cell.backgroundView = imageV;
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

@end
