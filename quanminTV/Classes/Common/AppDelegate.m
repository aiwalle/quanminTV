//
//  AppDelegate.m
//  LJAppStandard
//
//  Created by liang on 16/4/10.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "AppDelegate.h"
#import "LJTabBarController.h"
#import "LJNetWorkingTools.h"

@interface AppDelegate () {
    UIImageView *_adImageView;
    UIButton *_adButton;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[LJTabBarController alloc] init];
    [self.window makeKeyAndVisible];
    [self checkNetWork];
    
    return YES;
}

#pragma mark - **************** 检测网络状态
- (void)checkNetWork{
    [LJNetWorkingTools checkNetWorkStatus];
    [LJNetWorkingTools addNetWorkChangeEveryTime];
}







@end
