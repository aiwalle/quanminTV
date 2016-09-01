//
//  LJCollectionViewCell.h
//  quanminTV
//
//  Created by liang on 16/9/1.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJCollectionViewCell : UICollectionViewCell
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIColor *titleLabelTextColor;
@property (nonatomic, strong) UIFont *titleLabelTextFont;
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;
@property (nonatomic, assign) CGFloat titleLabelHeight;
@end
