//
//	LJMainRecommendModel.h
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <Foundation/Foundation.h>
@class LJMainLinkObject;

@interface LJMainRecommendModel : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * createAt;
@property (nonatomic, strong) NSString * ext;
@property (nonatomic, strong) NSString * fk;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) LJMainLinkObject * linkObject;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, assign) NSInteger slotId;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * subtitle;
@property (nonatomic, strong) NSString * thumb;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end