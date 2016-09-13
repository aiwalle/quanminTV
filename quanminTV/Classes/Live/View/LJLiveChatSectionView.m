//
//  LJLiveChatSectionView.m
//  quanminTV
//
//  Created by liang on 16/9/13.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJLiveChatSectionView.h"

@interface LJLiveChatSectionView()
@property (nonatomic, weak) UIView *titleLineView;
@property (nonatomic, weak) UIButton *selectedButton;
@property (nonatomic, strong) NSMutableArray *titleTextArr;
@property (nonatomic, strong) NSMutableArray *titleBtnArr;
@end

@implementation LJLiveChatSectionView
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

- (NSMutableArray *)titleTextArr {
    if (!_titleTextArr) {
        _titleTextArr = [@[@"聊天", @"排行"] mutableCopy];
    }
    return _titleTextArr;
}

- (void)setupSubviews {
    self.titleBtnArr = [NSMutableArray array];
    for (int i = 0; i < self.titleTextArr.count; i++) {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleBtn setTitle:self.titleTextArr[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [titleBtn.titleLabel setFont:themeFont15];
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:titleBtn];
        if (i == 0) {
            titleBtn.selected = YES;
            _selectedButton = titleBtn;
        }
        [self.titleBtnArr addObject:titleBtn];
    }
    
    UIView *titleLineView = [[UIView alloc] init];
    titleLineView.backgroundColor = [self.titleBtnArr.lastObject titleColorForState:UIControlStateSelected];
    _titleLineView = titleLineView;
    [self addSubview:titleLineView];
}

- (void)titleBtnClick:(UIButton *)sender {
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    [UIView animateWithDuration:0.25 animations:^{
        self.titleLineView.centerX = sender.centerX;
    }];
    
    NSUInteger index = [self.titleBtnArr indexOfObject:sender];
    if (self.delegate && [self.delegate respondsToSelector:@selector(liveChatView:didSelectedButtonWithIndex:)]) {
        [self.delegate liveChatView:self didSelectedButtonWithIndex:index];
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnWidth = DeviceWidth / self.titleBtnArr.count;
    CGFloat btnHeight = self.height;
    
    CGFloat btnTitleWidth = 0;
    for (int i = 0; i < self.titleBtnArr.count; i++) {
        UIButton *titleBtn = self.titleBtnArr[i];
        titleBtn.frame = CGRectMake(i * btnWidth, 0, btnWidth, btnHeight);
        btnTitleWidth = titleBtn.titleLabel.width;
    }
    CGFloat lineHeight = 2;
    NSInteger count = self.titleBtnArr.count;
    _titleLineView.frame = CGRectMake((DeviceWidth - (count * btnTitleWidth)) / count * 2, self.height - lineHeight, btnTitleWidth, lineHeight);
    _titleLineView.centerX = ((UIButton *)self.titleBtnArr.firstObject).centerX;
    
    [self titleBtnClick:self.titleBtnArr.firstObject];
}

@end
