//
//  LJMainSectioView.m
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJMainSectioView.h"

@interface LJMainSectioView()
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *sectionBtn;
@end

@implementation LJMainSectioView
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
    [self addSubview:self.redView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.sectionBtn];
}

- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.backgroundColor = [UIColor yellowColor];
        _titleLabel.text = @"精彩推荐";
        _titleLabel.font = themeFont12;
    }
    return _titleLabel;
}

- (UIButton *)sectionBtn {
    if (!_sectionBtn) {
        _sectionBtn = [[UIButton alloc] init];
        [_sectionBtn setTitle:@"换一换" forState:UIControlStateNormal];
        [_sectionBtn.titleLabel setFont:themeFont12];
        [_sectionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _sectionBtn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat redViewX = 0;
    CGFloat redViewY = self.height / 4;
    CGFloat redViewW = 15;
    CGFloat redViewH = self.height / 2;
    _redView.frame = CGRectMake(redViewX, redViewY, redViewW, redViewH);
    
    CGFloat titleX = redViewW + 5;
    CGFloat titleY = 0;
    CGFloat titleW = self.width - titleX - 80;
    CGFloat titleH = self.height;
    _titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat sectionBtnX = self.width - 80;
    CGFloat sectionBtnY = 0;
    CGFloat sectionBtnW = 80;
    CGFloat sectionBtnH = self.height;
    _sectionBtn.frame = CGRectMake(sectionBtnX, sectionBtnY, sectionBtnW, sectionBtnH);
}

@end
