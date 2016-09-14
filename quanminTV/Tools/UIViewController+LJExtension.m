//
//  UIViewController+LJExtension.m
//  quanminTV
//
//  Created by liang on 16/9/14.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "UIViewController+LJExtension.h"

@implementation UIViewController (LJExtension)
- (UINavigationController*)currentNavigationController {
    UINavigationController* nav = nil;
    if ([self isKindOfClass:[UINavigationController class]]) {
        nav = (id)self;
    }
    else {
        if ([self isKindOfClass:[UITabBarController class]]) {
            nav = [((UITabBarController*)self).selectedViewController currentNavigationController];
        }
        else {
            nav = self.navigationController;
        }
    }
    return nav;
}
@end
