//
//  UIImage+LJExtension.m
//  quanminTV
//
//  Created by liang on 16/9/9.
//  Copyright © 2016年 liang. All rights reserved.
//

#import "UIImage+LJExtension.h"

@implementation UIImage (LJExtension)
- (instancetype)circleImage {
    UIGraphicsBeginImageContext(self.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)circleImageNamed:(NSString *)name {
    return [[self imageNamed:name] circleImage];
}
@end
