//
//  LJCycleScrollView.m
//  quanminTV
//
//  Created by liang on 16/9/1.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJCycleScrollView.h"
#import "LJCycleCollectionCell.h"

@interface LJCycleScrollView()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, weak) UICollectionView *mainView; // 显示图片的collectionView
@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray *imagePathsGroup;
@property (nonatomic, assign) NSInteger totalItemsCount;
@property (nonatomic, strong) UIImageView *backgroundImageView; // 当imageURLs为空时的背景图
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation LJCycleScrollView
#pragma mark - **************** initial
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
        [self setupMainView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialization];
    [self setupMainView];
}

- (void)initialization {
    _autoScrollTimeInterval = 2.0;
    _titleLabelTextColor = [UIColor whiteColor];
    _titleLabelTextFont= [UIFont systemFontOfSize:14];
    _titleLabelBackgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _titleLabelHeight = 30;
    _bannerImageViewContentMode = UIViewContentModeScaleToFill;
    _autoScroll = YES;
}

// 设置显示图片的collectionView
- (void)setupMainView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    mainView.backgroundColor = [UIColor clearColor];
    mainView.pagingEnabled = YES;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.showsVerticalScrollIndicator = NO;
    [mainView registerClass:[LJCycleCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([LJCycleCollectionCell class])];
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [self addSubview:mainView];
    _mainView = mainView;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _flowLayout.itemSize = self.frame.size;
    
    _mainView.frame = self.bounds;
    // ?
    if (_mainView.contentOffset.x == 0 &&  _totalItemsCount) {
    int targetIndex = 0;
    targetIndex = _totalItemsCount * 0.5;

    [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    
    CGSize size = CGSizeZero;
//    CGFloat x = (self.width - size.width) * 0.5;
    CGFloat y = self.mainView.height - size.height - _titleLabelHeight;
    CGRect pageControlFrame = CGRectMake(self.width - 100, y, 100, _titleLabelHeight);
    self.pageControl.frame = pageControlFrame;
    
    if (self.backgroundImageView) {
        self.backgroundImageView.frame = self.bounds;
    }
    
}

#pragma mark - **************** factory Method
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<LJCycleScrollViewDelegate>)delegate placeholderImage:(UIImage *)placeholderImage {
    LJCycleScrollView *cycleScrollView = [[self alloc] initWithFrame:frame];
    cycleScrollView.delegate = delegate;
    cycleScrollView.placeholderImage = placeholderImage;
    
    return cycleScrollView;
}

#pragma mark - **************** properties
- (void)setPlaceholderImage:(UIImage *)placeholderImage {
    _placeholderImage = placeholderImage;
    
    if (!self.backgroundImageView) {
        UIImageView *bgImageView = [[UIImageView alloc] init];
        bgImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self insertSubview:bgImageView belowSubview:self.mainView];
        self.backgroundImageView = bgImageView;
    }
    
    self.backgroundImageView.image = placeholderImage;
}

- (void)setImagePathsGroup:(NSArray *)imagePathsGroup {
    [self invalidateTimer];
    
    _imagePathsGroup = imagePathsGroup;
    
    _totalItemsCount = self.imagePathsGroup.count * 100;
    
    if (imagePathsGroup.count != 1) {
        self.mainView.scrollEnabled = YES;
        [self setAutoScroll:self.autoScroll];
    } else {
        self.mainView.scrollEnabled = NO;
    }
    
    [self setupPageControl];
    [self.mainView reloadData];
}

- (void)setImageURLStringsGroup:(NSArray *)imageURLStringsGroup{
    _imageURLStringsGroup = imageURLStringsGroup;
    
    NSMutableArray *temp = [NSMutableArray array];
    [_imageURLStringsGroup enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * stop) {
        NSString *urlString;
        if ([obj isKindOfClass:[NSString class]]) {
            urlString = obj;
        } else if ([obj isKindOfClass:[NSURL class]]) {
            NSURL *url = (NSURL *)obj;
            urlString = [url absoluteString];
        }
        if (urlString) {
            [temp addObject:urlString];
        }
    }];
    self.imagePathsGroup = [temp copy];
}

-(void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    
    [self invalidateTimer];
    
    if (_autoScroll) {
        [self setupTimer];
    }
}

- (void)setupPageControl {
    if (_pageControl) [_pageControl removeFromSuperview]; // 重新加载数据时调整
    
    if (self.imagePathsGroup.count == 0) return;
    
    if (self.imagePathsGroup.count == 1) return;
    
    int indexOnPageControl = [self pageControlIndexWithCurrentCellIndex:[self currentIndex]];
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.imagePathsGroup.count;
    pageControl.userInteractionEnabled = NO;
    pageControl.currentPage = indexOnPageControl;
    [self addSubview:pageControl];
    _pageControl = pageControl;
}

- (void)automaticScroll {
    if (0 == _totalItemsCount) return;
    int currentIndex = [self currentIndex];
    int targetIndex = currentIndex + 1;
    [self scrollToIndex:targetIndex];
}

- (void)scrollToIndex:(int)targetIndex {
    if (targetIndex >= _totalItemsCount) {
        targetIndex = _totalItemsCount * 0.5;
        [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        return;
    }
    [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

#pragma mark - **************** timer
- (void)invalidateTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)setupTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollTimeInterval target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


#pragma mark - **************** UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _totalItemsCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LJCycleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LJCycleCollectionCell class]) forIndexPath:indexPath];
    long itemIndex = [self pageControlIndexWithCurrentCellIndex:indexPath.item];
    
    NSString *imagePath = self.imagePathsGroup[itemIndex];
    
    if ([imagePath isKindOfClass:[NSString class]]) {
        if ([imagePath hasPrefix:@"http"]) {
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:self.placeholderImage];
        } else {
            UIImage *image = [UIImage imageNamed:imagePath];
            if (!image) {
                [UIImage imageWithContentsOfFile:imagePath];
            }
            cell.imageView.image = image;
        }
    } else if ([imagePath isKindOfClass:[UIImage class]]) {
        cell.imageView.image = (UIImage *)imagePath;
    }
    
    if (_titlesGroup.count && itemIndex < _titlesGroup.count) {
        cell.title = _titlesGroup[itemIndex];
    }
    
    cell.titleLabelBackgroundColor = self.titleLabelBackgroundColor;
    cell.titleLabelHeight = self.titleLabelHeight;
    cell.titleLabelTextColor = self.titleLabelTextColor;
    cell.titleLabelTextFont = self.titleLabelTextFont;
    cell.imageView.contentMode = self.bannerImageViewContentMode;
    cell.clipsToBounds = YES;
    return cell;
}

- (int)pageControlIndexWithCurrentCellIndex:(NSInteger)index {
    return (int)index % self.imagePathsGroup.count;
}

- (int)currentIndex {
    if (_mainView.width == 0 || _mainView.height == 0) {
        return 0;
    }
    
    int index = 0;
    if (_flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        index = (_mainView.contentOffset.x + _flowLayout.itemSize.width * 0.5) / _flowLayout.itemSize.width;
    }
    return MAX(0, index);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectItemAtIndex:)]) {
        [self.delegate cycleScrollView:self didSelectItemAtIndex:[self pageControlIndexWithCurrentCellIndex:indexPath.item % self.imagePathsGroup.count]];
    }
}

#pragma mark - **************** UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.imagePathsGroup.count) return; // 解决清除timer时偶尔会出现的问题
    int itemIndex = [self currentIndex];
    int indexOnPageControl = [self pageControlIndexWithCurrentCellIndex:itemIndex];
    
    _pageControl.currentPage = indexOnPageControl;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.autoScroll) {
        [self invalidateTimer];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.autoScroll) {
        [self setupTimer];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:self.mainView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (!self.imagePathsGroup.count) return; // 解决清除timer时偶尔会出现的问题
}

@end
