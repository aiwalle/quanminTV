//
//  LJLiveTextView.m
//  quanminTV
//
//  Created by liang on 16/9/13.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJLiveTextView.h"

@interface LJLiveTextView()
@property (nonatomic, strong) UITextField *bottomTextField;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@end

@implementation LJLiveTextView
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
    [self addSubview:self.bottomTextField];
    [self addSubview:self.lineView];
    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat textViewX = 50;
    CGFloat textViewY = 5;
    CGFloat textViewW = DeviceWidth - textViewX * 2;
    CGFloat textViewH = self.height - textViewY * 2;
    _bottomTextField.frame = CGRectMake(textViewX, textViewY, textViewW, textViewH);
    _bottomTextField.layer.cornerRadius = textViewH * 0.5;
    
    CGFloat lineX = 0;
    CGFloat lineH = 1;
    CGFloat lineY = 0;
    CGFloat lineW = self.width;
    _lineView.frame = CGRectMake(lineX, lineY, lineW, lineH);
    
    CGFloat leftX = 5;
    CGFloat leftY = 5;
    CGFloat leftW = self.height - leftX * 2;
    CGFloat leftH = leftW;
    _leftBtn.frame = CGRectMake(leftX, leftY, leftW, leftH);
    
    CGFloat rightX = self.width - 5 -leftW;
    CGFloat rightY = leftY;
    CGFloat rightW = leftW;
    CGFloat rightH = leftW;
    _rightBtn.frame = CGRectMake(rightX, rightY, rightW, rightH);
}

- (UITextField *)bottomTextField {
    if (!_bottomTextField) {
        _bottomTextField = [[UITextField alloc] init];
        _bottomTextField.backgroundColor = [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1.00];
        _bottomTextField.placeholder = @"说点什么吧";
        // 光标右移
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        _bottomTextField.leftViewMode = UITextFieldViewModeAlways;
        leftView.backgroundColor = [UIColor clearColor];
        _bottomTextField.leftView = leftView;
    }
    return _bottomTextField;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithRed:0.780 green:0.780 blue:0.780 alpha:1.00];
    }
    return _lineView;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.backgroundColor = [UIColor redColor];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.backgroundColor = [UIColor yellowColor];
    }
    return _rightBtn;
}
@end
