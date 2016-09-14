//
//  LJADViewController.m
//  quanminTV
//
//  Created by liang on 16/9/14.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJADViewController.h"
@interface LJADViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end
@implementation LJADViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我是广告";
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.backgroundColor = [UIColor whiteColor];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com/"]]];
    [self.view addSubview:self.webView];
}
@end
