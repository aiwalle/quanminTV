//
//  LJDataBaseTool.m
//  quanminTV
//
//  Created by liang on 16/10/19.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "LJDataBaseTool.h"

@implementation LJDataBaseTool
static LJDataBaseTool *instance = nil;

+ (LJDataBaseTool *)shareInstance {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    }) ;
    
    return instance;
}



@end
