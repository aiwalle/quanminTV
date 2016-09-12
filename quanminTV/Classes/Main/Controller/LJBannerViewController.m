//
//  LJBannerViewController.m
//  quanminTV
//
//  Created by liang on 16/9/1.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJBannerViewController.h"

@interface LJBannerViewController()
@property (nonatomic, strong) id responseObject;
@end

@implementation LJBannerViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UITextView *textview = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, DeviceWidth, DeviceHeight)];
//    
//    textview.text = self.urlString;
//    
//    textview.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:textview];
    self.view.backgroundColor = [UIColor whiteColor];
    [self requestNetWorking];
}

- (void)requestNetWorking {
    LJWeakSelf;
    [LJNetWorkingTools GET:@"http://www.quanmin.tv/json/page/appv2-index/info.json?1473646855" params:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        self.responseObject = responseObject;
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}

- (void)dealloc {
    NSLog(@"%@-dealloc", [self class]);
}
@end
