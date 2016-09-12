//
//	LJMainLinkObject.h
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <Foundation/Foundation.h>

@interface LJMainLinkObject : NSObject

@property (nonatomic, strong) NSString * announcement;
@property (nonatomic, strong) NSString * appShufflingImage;
@property (nonatomic, strong) NSString * avatar;
@property (nonatomic, strong) NSString * beautyCover;
@property (nonatomic, strong) NSString * categoryId;
@property (nonatomic, strong) NSString * categoryName;
@property (nonatomic, strong) NSString * categorySlug;
@property (nonatomic, strong) NSString * createAt;
@property (nonatomic, strong) NSString * defaultImage;
@property (nonatomic, strong) NSString * follow;
@property (nonatomic, strong) NSString * grade;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, strong) NSString * intro;
@property (nonatomic, strong) NSString * level;
@property (nonatomic, strong) NSString * like;
@property (nonatomic, strong) NSString * loveCover;
@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * playAt;
@property (nonatomic, strong) NSString * recommendImage;
@property (nonatomic, assign) NSInteger screen;
@property (nonatomic, strong) NSString * slug;
@property (nonatomic, strong) NSString * startTime;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * uid;
@property (nonatomic, strong) NSString * video;
@property (nonatomic, strong) NSString * videoQuality;
@property (nonatomic, strong) NSString * view;
@property (nonatomic, strong) NSString * weight;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end