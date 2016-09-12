//
//	LJMainBannerModel.m
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LJMainBannerModel.h"

NSString *const kLJMainBannerModelContent = @"content";
NSString *const kLJMainBannerModelCreateAt = @"create_at";
NSString *const kLJMainBannerModelExt = @"ext";
NSString *const kLJMainBannerModelFk = @"fk";
NSString *const kLJMainBannerModelIdField = @"id";
NSString *const kLJMainBannerModelLink = @"link";
NSString *const kLJMainBannerModelPriority = @"priority";
NSString *const kLJMainBannerModelSlotId = @"slot_id";
NSString *const kLJMainBannerModelStatus = @"status";
NSString *const kLJMainBannerModelSubtitle = @"subtitle";
NSString *const kLJMainBannerModelThumb = @"thumb";
NSString *const kLJMainBannerModelTitle = @"title";

@interface LJMainBannerModel ()
@end
@implementation LJMainBannerModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLJMainBannerModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kLJMainBannerModelContent];
	}	
	if(![dictionary[kLJMainBannerModelCreateAt] isKindOfClass:[NSNull class]]){
		self.createAt = dictionary[kLJMainBannerModelCreateAt];
	}	
	if(![dictionary[kLJMainBannerModelExt] isKindOfClass:[NSNull class]]){
		self.ext = dictionary[kLJMainBannerModelExt];
	}	
	if(![dictionary[kLJMainBannerModelFk] isKindOfClass:[NSNull class]]){
		self.fk = dictionary[kLJMainBannerModelFk];
	}	
	if(![dictionary[kLJMainBannerModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kLJMainBannerModelIdField] integerValue];
	}

	if(![dictionary[kLJMainBannerModelLink] isKindOfClass:[NSNull class]]){
		self.link = dictionary[kLJMainBannerModelLink];
	}	
	if(![dictionary[kLJMainBannerModelPriority] isKindOfClass:[NSNull class]]){
		self.priority = [dictionary[kLJMainBannerModelPriority] integerValue];
	}

	if(![dictionary[kLJMainBannerModelSlotId] isKindOfClass:[NSNull class]]){
		self.slotId = [dictionary[kLJMainBannerModelSlotId] integerValue];
	}

	if(![dictionary[kLJMainBannerModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kLJMainBannerModelStatus] integerValue];
	}

	if(![dictionary[kLJMainBannerModelSubtitle] isKindOfClass:[NSNull class]]){
		self.subtitle = dictionary[kLJMainBannerModelSubtitle];
	}	
	if(![dictionary[kLJMainBannerModelThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kLJMainBannerModelThumb];
	}	
	if(![dictionary[kLJMainBannerModelTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kLJMainBannerModelTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.content != nil){
		dictionary[kLJMainBannerModelContent] = self.content;
	}
	if(self.createAt != nil){
		dictionary[kLJMainBannerModelCreateAt] = self.createAt;
	}
	if(self.ext != nil){
		dictionary[kLJMainBannerModelExt] = self.ext;
	}
	if(self.fk != nil){
		dictionary[kLJMainBannerModelFk] = self.fk;
	}
	dictionary[kLJMainBannerModelIdField] = @(self.idField);
	if(self.link != nil){
		dictionary[kLJMainBannerModelLink] = self.link;
	}
	dictionary[kLJMainBannerModelPriority] = @(self.priority);
	dictionary[kLJMainBannerModelSlotId] = @(self.slotId);
	dictionary[kLJMainBannerModelStatus] = @(self.status);
	if(self.subtitle != nil){
		dictionary[kLJMainBannerModelSubtitle] = self.subtitle;
	}
	if(self.thumb != nil){
		dictionary[kLJMainBannerModelThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kLJMainBannerModelTitle] = self.title;
	}
	return dictionary;

}

@end