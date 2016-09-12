//
//	LJMainGamesModel.m
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LJMainGamesModel.h"
#import "LJMainExt.h"
NSString *const kLJMainGamesModelMainExt = @"MainExt";
NSString *const kLJMainGamesModelCreateAt = @"create_at";
NSString *const kLJMainGamesModelFk = @"fk";
NSString *const kLJMainGamesModelIdField = @"id";
NSString *const kLJMainGamesModelLink = @"link";
NSString *const kLJMainGamesModelPriority = @"priority";
NSString *const kLJMainGamesModelSlotId = @"slot_id";
NSString *const kLJMainGamesModelStatus = @"status";
NSString *const kLJMainGamesModelSubtitle = @"subtitle";
NSString *const kLJMainGamesModelThumb = @"thumb";
NSString *const kLJMainGamesModelTitle = @"title";

@interface LJMainGamesModel ()
@end
@implementation LJMainGamesModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLJMainGamesModelMainExt] isKindOfClass:[NSNull class]]){
		self.mainExt = [[LJMainExt alloc] initWithDictionary:dictionary[kLJMainGamesModelMainExt]];
	}

	if(![dictionary[kLJMainGamesModelCreateAt] isKindOfClass:[NSNull class]]){
		self.createAt = dictionary[kLJMainGamesModelCreateAt];
	}	
	if(![dictionary[kLJMainGamesModelFk] isKindOfClass:[NSNull class]]){
		self.fk = dictionary[kLJMainGamesModelFk];
	}	
	if(![dictionary[kLJMainGamesModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kLJMainGamesModelIdField] integerValue];
	}

	if(![dictionary[kLJMainGamesModelLink] isKindOfClass:[NSNull class]]){
		self.link = dictionary[kLJMainGamesModelLink];
	}	
	if(![dictionary[kLJMainGamesModelPriority] isKindOfClass:[NSNull class]]){
		self.priority = [dictionary[kLJMainGamesModelPriority] integerValue];
	}

	if(![dictionary[kLJMainGamesModelSlotId] isKindOfClass:[NSNull class]]){
		self.slotId = [dictionary[kLJMainGamesModelSlotId] integerValue];
	}

	if(![dictionary[kLJMainGamesModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kLJMainGamesModelStatus] integerValue];
	}

	if(![dictionary[kLJMainGamesModelSubtitle] isKindOfClass:[NSNull class]]){
		self.subtitle = dictionary[kLJMainGamesModelSubtitle];
	}	
	if(![dictionary[kLJMainGamesModelThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kLJMainGamesModelThumb];
	}	
	if(![dictionary[kLJMainGamesModelTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kLJMainGamesModelTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.mainExt != nil){
		dictionary[kLJMainGamesModelMainExt] = [self.mainExt toDictionary];
	}
	if(self.createAt != nil){
		dictionary[kLJMainGamesModelCreateAt] = self.createAt;
	}
	if(self.fk != nil){
		dictionary[kLJMainGamesModelFk] = self.fk;
	}
	dictionary[kLJMainGamesModelIdField] = @(self.idField);
	if(self.link != nil){
		dictionary[kLJMainGamesModelLink] = self.link;
	}
	dictionary[kLJMainGamesModelPriority] = @(self.priority);
	dictionary[kLJMainGamesModelSlotId] = @(self.slotId);
	dictionary[kLJMainGamesModelStatus] = @(self.status);
	if(self.subtitle != nil){
		dictionary[kLJMainGamesModelSubtitle] = self.subtitle;
	}
	if(self.thumb != nil){
		dictionary[kLJMainGamesModelThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kLJMainGamesModelTitle] = self.title;
	}
	return dictionary;

}

@end