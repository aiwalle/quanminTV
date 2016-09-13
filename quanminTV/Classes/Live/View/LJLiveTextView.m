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
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat textViewX = 50;
    CGFloat textViewY = 5;
    CGFloat textViewW = DeviceWidth - textViewX * 2;
    CGFloat textViewH = self.height - textViewY * 2;
    _bottomTextField.frame = CGRectMake(textViewX, textViewY, textViewW, textViewH);
}

- (UITextField *)bottomTextField {
    if (!_bottomTextField) {
        _bottomTextField = [[UITextField alloc] init];
        _bottomTextField.placeholder = @"说点什么吧";
    }
    return _bottomTextField;
}
@end
