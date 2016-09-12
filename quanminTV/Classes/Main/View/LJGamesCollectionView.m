//
//  LJGamesCollectionView.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJGamesCollectionView.h"
#import "LJGamesCollectionCell.h"
@interface LJGamesCollectionView()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *mainView;
@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;

@end

@implementation LJGamesCollectionView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder  {
    
    self = [super initWithCoder:coder];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 5;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;
    self.flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    mainView.backgroundColor = [UIColor clearColor];
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[LJGamesCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([LJGamesCollectionCell class])];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    _mainView = mainView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _flowLayout.itemSize = CGSizeMake(60, 80);
    _mainView.frame = self.bounds;
}

- (void)setGamesArr:(NSMutableArray *)gamesArr {
    _gamesArr = gamesArr;
    [self.mainView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.gamesArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJGamesCollectionCell *cell = [LJGamesCollectionCell cellWithCollectionView:collectionView indexPath:indexPath];
    cell.gamesModel = self.gamesArr[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(gamesCollectionView:didSelectItemAtIndex:)]) {
        [self.delegate gamesCollectionView:self didSelectItemAtIndex:indexPath.item];
    }
}

@end
