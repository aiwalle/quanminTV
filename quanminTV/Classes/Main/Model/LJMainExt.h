//
//	LJMainExt.h
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <Foundation/Foundation.h>

@interface LJMainExt : NSObject

@property (nonatomic, strong) NSString * classification;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end