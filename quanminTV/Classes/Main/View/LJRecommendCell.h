//
//  LJRecommendCell.h
//  quanminTV
//
//  Created by liang on 16/9/2.
//  Copyright © 2016年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJRecommendCollectionView.h"
@interface LJRecommendCell : UITableViewCell
@property (nonatomic, strong) LJRecommendCollectionView *recommendCollevtionV;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
