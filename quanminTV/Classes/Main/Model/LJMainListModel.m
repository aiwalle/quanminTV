//
//	LJMainListModel.m
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LJMainListModel.h"

NSString *const kLJMainListModelCategorySlug = @"category_slug";
NSString *const kLJMainListModelName = @"name";
NSString *const kLJMainListModelSlug = @"slug";

@interface LJMainListModel ()
@end
@implementation LJMainListModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLJMainListModelCategorySlug] isKindOfClass:[NSNull class]]){
		self.categorySlug = dictionary[kLJMainListModelCategorySlug];
	}	
	if(![dictionary[kLJMainListModelName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kLJMainListModelName];
	}	
	if(![dictionary[kLJMainListModelSlug] isKindOfClass:[NSNull class]]){
		self.slug = dictionary[kLJMainListModelSlug];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.categorySlug != nil){
		dictionary[kLJMainListModelCategorySlug] = self.categorySlug;
	}
	if(self.name != nil){
		dictionary[kLJMainListModelName] = self.name;
	}
	if(self.slug != nil){
		dictionary[kLJMainListModelSlug] = self.slug;
	}
	return dictionary;

}


@end