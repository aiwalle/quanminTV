//
//  LJBannerViewController.m
//  quanminTV
//
//  Created by liang on 16/9/1.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJBannerViewController.h"

@interface LJBannerViewController()

@end

@implementation LJBannerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight)];
    
    textview.text = self.urlString;
    
    textview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textview];
}
@end
