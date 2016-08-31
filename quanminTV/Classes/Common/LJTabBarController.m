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
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    // 选中状态下按钮文字的颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

/**
 *  添加所有子控制器
 */
- (void)setupChildVCs{
    [self setupChildVc:[[LJMainViewController alloc] init] title:@"首页" image:@"11" selectedImage:@"12"];
    [self setupChildVc:[[LJColumnViewController alloc] init] title:@"栏目" image:@"21" selectedImage:@"22"];
    [self setupChildVc:[[LJLiveViewController alloc] init] title:@"直播" image:@"31" selectedImage:@"32"];
    [self setupChildVc:[[LJMineViewController alloc] init] title:@"我的" image:@"41" selectedImage:@"42"];
}

/**
 * 添加一个子控制器
 * @param title 文字
 * @param image 图片
 * @param selectedImage 选中时的图片
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    LJNavigationController *nav = [[LJNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:image];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
}

@end
