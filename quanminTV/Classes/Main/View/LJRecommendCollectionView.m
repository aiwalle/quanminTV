//
//  LJRecommendCollectionView.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJRecommendCollectionView.h"
#import "LJRecommendCollectionCell.h"
#import "LJMainLinkObject.h"
@interface LJRecommendCollectionView()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *mainView;
@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;
@end
@implementation LJRecommendCollectionView
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
    flowLayout.minimumLineSpacing = 10;
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    mainView.backgroundColor = [UIColor clearColor];
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[LJRecommendCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([LJRecommendCollectionCell class])];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    _mainView = mainView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _flowLayout.itemSize = CGSizeMake((self.width - 10) * 0.5, 120);
    _mainView.frame = self.bounds;
}

- (void)setRecommendArr:(NSMutableArray *)recommendArr {
    _recommendArr = recommendArr;
    [self.mainView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.isLivingController) {
        return 30;
    }
    return self.recommendArr.count > 3 ? 4 : self.recommendArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJRecommendCollectionCell *cell = [LJRecommendCollectionCell cellWithCollectionView:collectionView indexPath:indexPath];
    NSDictionary *linkDic = [self.recommendArr[indexPath.item] valueForKey:@"link_object"];
    LJMainLinkObject *linkObject = [[LJMainLinkObject alloc] initWithDictionary:linkDic];
//    cell.linkObject = linkObject;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(recommendCollectionView:didSelectItemAtIndex:)]) {
        [self.delegate recommendCollectionView:self didSelectItemAtIndex:indexPath.item];
    }
}
@end
