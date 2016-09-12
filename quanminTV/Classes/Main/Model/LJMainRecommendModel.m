//
//	LJMainRecommendModel.m
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LJMainRecommendModel.h"
#import "LJMainLinkObject.h"
NSString *const kLJMainRecommendModelContent = @"content";
NSString *const kLJMainRecommendModelCreateAt = @"create_at";
NSString *const kLJMainRecommendModelExt = @"ext";
NSString *const kLJMainRecommendModelFk = @"fk";
NSString *const kLJMainRecommendModelIdField = @"id";
NSString *const kLJMainRecommendModelLink = @"link";
NSString *const kLJMainRecommendModelLinkObject = @"link_object";
NSString *const kLJMainRecommendModelPriority = @"priority";
NSString *const kLJMainRecommendModelSlotId = @"slot_id";
NSString *const kLJMainRecommendModelStatus = @"status";
NSString *const kLJMainRecommendModelSubtitle = @"subtitle";
NSString *const kLJMainRecommendModelThumb = @"thumb";
NSString *const kLJMainRecommendModelTitle = @"title";

@interface LJMainRecommendModel ()
@end
@implementation LJMainRecommendModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLJMainRecommendModelContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kLJMainRecommendModelContent];
	}	
	if(![dictionary[kLJMainRecommendModelCreateAt] isKindOfClass:[NSNull class]]){
		self.createAt = dictionary[kLJMainRecommendModelCreateAt];
	}	
	if(![dictionary[kLJMainRecommendModelExt] isKindOfClass:[NSNull class]]){
		self.ext = dictionary[kLJMainRecommendModelExt];
	}	
	if(![dictionary[kLJMainRecommendModelFk] isKindOfClass:[NSNull class]]){
		self.fk = dictionary[kLJMainRecommendModelFk];
	}	
	if(![dictionary[kLJMainRecommendModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kLJMainRecommendModelIdField] integerValue];
	}

	if(![dictionary[kLJMainRecommendModelLink] isKindOfClass:[NSNull class]]){
		self.link = dictionary[kLJMainRecommendModelLink];
	}	
	if(![dictionary[kLJMainRecommendModelLinkObject] isKindOfClass:[NSNull class]]){
		self.linkObject = [[LJMainLinkObject alloc] initWithDictionary:dictionary[kLJMainRecommendModelLinkObject]];
	}

	if(![dictionary[kLJMainRecommendModelPriority] isKindOfClass:[NSNull class]]){
		self.priority = [dictionary[kLJMainRecommendModelPriority] integerValue];
	}

	if(![dictionary[kLJMainRecommendModelSlotId] isKindOfClass:[NSNull class]]){
		self.slotId = [dictionary[kLJMainRecommendModelSlotId] integerValue];
	}

	if(![dictionary[kLJMainRecommendModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kLJMainRecommendModelStatus] integerValue];
	}

	if(![dictionary[kLJMainRecommendModelSubtitle] isKindOfClass:[NSNull class]]){
		self.subtitle = dictionary[kLJMainRecommendModelSubtitle];
	}	
	if(![dictionary[kLJMainRecommendModelThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kLJMainRecommendModelThumb];
	}	
	if(![dictionary[kLJMainRecommendModelTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kLJMainRecommendModelTitle];
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
		dictionary[kLJMainRecommendModelContent] = self.content;
	}
	if(self.createAt != nil){
		dictionary[kLJMainRecommendModelCreateAt] = self.createAt;
	}
	if(self.ext != nil){
		dictionary[kLJMainRecommendModelExt] = self.ext;
	}
	if(self.fk != nil){
		dictionary[kLJMainRecommendModelFk] = self.fk;
	}
	dictionary[kLJMainRecommendModelIdField] = @(self.idField);
	if(self.link != nil){
		dictionary[kLJMainRecommendModelLink] = self.link;
	}
	if(self.linkObject != nil){
		dictionary[kLJMainRecommendModelLinkObject] = [self.linkObject toDictionary];
	}
	dictionary[kLJMainRecommendModelPriority] = @(self.priority);
	dictionary[kLJMainRecommendModelSlotId] = @(self.slotId);
	dictionary[kLJMainRecommendModelStatus] = @(self.status);
	if(self.subtitle != nil){
		dictionary[kLJMainRecommendModelSubtitle] = self.subtitle;
	}
	if(self.thumb != nil){
		dictionary[kLJMainRecommendModelThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kLJMainRecommendModelTitle] = self.title;
	}
	return dictionary;

}

@end