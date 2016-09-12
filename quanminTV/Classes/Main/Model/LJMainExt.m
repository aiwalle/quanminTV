//
//	LJMainExt.m
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LJMainExt.h"

NSString *const kLJMainExtClassification = @"classification";

@interface LJMainExt ()
@end
@implementation LJMainExt




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLJMainExtClassification] isKindOfClass:[NSNull class]]){
		self.classification = dictionary[kLJMainExtClassification];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.classification != nil){
		dictionary[kLJMainExtClassification] = self.classification;
	}
	return dictionary;

}


@end