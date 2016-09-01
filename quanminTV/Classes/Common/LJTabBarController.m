//
//  LJTabBarController.m
//  LJAppStandard
//
//  Created by liang on 16/4/10.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJTabBarController.h"
#import "LJNavigationController.h"
#import "LJMainViewController.h"
#import "LJColumnViewController.h"
#import "LJLiveViewController.h"
#import "LJMineViewController.h"
@interface LJTabBarController ()

@end

@implementation LJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabbarItems];
    [self setupChildVCs];
    
}

- (void)setupTabBar{
}

/**
 *  统一设置tabbar按钮的文字样式
 */
- (void)setupTabbarItems{
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    // 普通状态下按钮文字的颜色
    normalAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.600 green:0.600 blue:0.600 alpha:1.00];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    // 选中状态下按钮文字的颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.988 green:0.306 blue:0.239 alpha:1.00];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

/**
 *  添加所有子控制器
 */
- (void)setupChildVCs{
    [self setupChildVc:[[LJMainViewController alloc] init] title:@"首页" image:@"main" selectedImage:@"main_sel"];
    [self setupChildVc:[[LJColumnViewController alloc] init] title:@"栏目" image:@"column" selectedImage:@"column_sel"];
    [self setupChildVc:[[LJLiveViewController alloc] init] title:@"直播" image:@"live" selectedImage:@"live_sel"];
    [self setupChildVc:[[LJMineViewController alloc] init] title:@"我的" image:@"mine" selectedImage:@"mine_sel"];
}

/**
 * 添加一个子控制器
 * @param title 文字
 * @param image 图片
 * @param selectedImage 选中时的图片
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];  
}

@end
