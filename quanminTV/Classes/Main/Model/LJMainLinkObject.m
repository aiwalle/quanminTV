//
//	LJMainLinkObject.m
//
//	Create by 健 梁 on 12/9/2016
//	Copyright © 2016. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LJMainLinkObject.h"

NSString *const kLJMainLinkObjectAnnouncement = @"announcement";
NSString *const kLJMainLinkObjectAppShufflingImage = @"app_shuffling_image";
NSString *const kLJMainLinkObjectAvatar = @"avatar";
NSString *const kLJMainLinkObjectBeautyCover = @"beauty_cover";
NSString *const kLJMainLinkObjectCategoryId = @"category_id";
NSString *const kLJMainLinkObjectCategoryName = @"category_name";
NSString *const kLJMainLinkObjectCategorySlug = @"category_slug";
NSString *const kLJMainLinkObjectCreateAt = @"create_at";
NSString *const kLJMainLinkObjectDefaultImage = @"default_image";
NSString *const kLJMainLinkObjectFollow = @"follow";
NSString *const kLJMainLinkObjectGrade = @"grade";
NSString *const kLJMainLinkObjectHidden = @"hidden";
NSString *const kLJMainLinkObjectIntro = @"intro";
NSString *const kLJMainLinkObjectLevel = @"level";
NSString *const kLJMainLinkObjectLike = @"like";
NSString *const kLJMainLinkObjectLoveCover = @"love_cover";
NSString *const kLJMainLinkObjectNick = @"nick";
NSString *const kLJMainLinkObjectPlayAt = @"play_at";
NSString *const kLJMainLinkObjectRecommendImage = @"recommend_image";
NSString *const kLJMainLinkObjectScreen = @"screen";
NSString *const kLJMainLinkObjectSlug = @"slug";
NSString *const kLJMainLinkObjectStartTime = @"start_time";
NSString *const kLJMainLinkObjectStatus = @"status";
NSString *const kLJMainLinkObjectThumb = @"thumb";
NSString *const kLJMainLinkObjectTitle = @"title";
NSString *const kLJMainLinkObjectUid = @"uid";
NSString *const kLJMainLinkObjectVideo = @"video";
NSString *const kLJMainLinkObjectVideoQuality = @"video_quality";
NSString *const kLJMainLinkObjectView = @"view";
NSString *const kLJMainLinkObjectWeight = @"weight";

@interface LJMainLinkObject ()
@end
@implementation LJMainLinkObject




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLJMainLinkObjectAnnouncement] isKindOfClass:[NSNull class]]){
		self.announcement = dictionary[kLJMainLinkObjectAnnouncement];
	}	
	if(![dictionary[kLJMainLinkObjectAppShufflingImage] isKindOfClass:[NSNull class]]){
		self.appShufflingImage = dictionary[kLJMainLinkObjectAppShufflingImage];
	}	
	if(![dictionary[kLJMainLinkObjectAvatar] isKindOfClass:[NSNull class]]){
		self.avatar = dictionary[kLJMainLinkObjectAvatar];
	}	
	if(![dictionary[kLJMainLinkObjectBeautyCover] isKindOfClass:[NSNull class]]){
		self.beautyCover = dictionary[kLJMainLinkObjectBeautyCover];
	}	
	if(![dictionary[kLJMainLinkObjectCategoryId] isKindOfClass:[NSNull class]]){
		self.categoryId = dictionary[kLJMainLinkObjectCategoryId];
	}	
	if(![dictionary[kLJMainLinkObjectCategoryName] isKindOfClass:[NSNull class]]){
		self.categoryName = dictionary[kLJMainLinkObjectCategoryName];
	}	
	if(![dictionary[kLJMainLinkObjectCategorySlug] isKindOfClass:[NSNull class]]){
		self.categorySlug = dictionary[kLJMainLinkObjectCategorySlug];
	}	
	if(![dictionary[kLJMainLinkObjectCreateAt] isKindOfClass:[NSNull class]]){
		self.createAt = dictionary[kLJMainLinkObjectCreateAt];
	}	
	if(![dictionary[kLJMainLinkObjectDefaultImage] isKindOfClass:[NSNull class]]){
		self.defaultImage = dictionary[kLJMainLinkObjectDefaultImage];
	}	
	if(![dictionary[kLJMainLinkObjectFollow] isKindOfClass:[NSNull class]]){
		self.follow = dictionary[kLJMainLinkObjectFollow];
	}	
	if(![dictionary[kLJMainLinkObjectGrade] isKindOfClass:[NSNull class]]){
		self.grade = dictionary[kLJMainLinkObjectGrade];
	}	
	if(![dictionary[kLJMainLinkObjectHidden] isKindOfClass:[NSNull class]]){
		self.hidden = [dictionary[kLJMainLinkObjectHidden] boolValue];
	}

	if(![dictionary[kLJMainLinkObjectIntro] isKindOfClass:[NSNull class]]){
		self.intro = dictionary[kLJMainLinkObjectIntro];
	}	
	if(![dictionary[kLJMainLinkObjectLevel] isKindOfClass:[NSNull class]]){
		self.level = dictionary[kLJMainLinkObjectLevel];
	}	
	if(![dictionary[kLJMainLinkObjectLike] isKindOfClass:[NSNull class]]){
		self.like = dictionary[kLJMainLinkObjectLike];
	}	
	if(![dictionary[kLJMainLinkObjectLoveCover] isKindOfClass:[NSNull class]]){
		self.loveCover = dictionary[kLJMainLinkObjectLoveCover];
	}	
	if(![dictionary[kLJMainLinkObjectNick] isKindOfClass:[NSNull class]]){
		self.nick = dictionary[kLJMainLinkObjectNick];
	}	
	if(![dictionary[kLJMainLinkObjectPlayAt] isKindOfClass:[NSNull class]]){
		self.playAt = dictionary[kLJMainLinkObjectPlayAt];
	}	
	if(![dictionary[kLJMainLinkObjectRecommendImage] isKindOfClass:[NSNull class]]){
		self.recommendImage = dictionary[kLJMainLinkObjectRecommendImage];
	}	
	if(![dictionary[kLJMainLinkObjectScreen] isKindOfClass:[NSNull class]]){
		self.screen = [dictionary[kLJMainLinkObjectScreen] integerValue];
	}

	if(![dictionary[kLJMainLinkObjectSlug] isKindOfClass:[NSNull class]]){
		self.slug = dictionary[kLJMainLinkObjectSlug];
	}	
	if(![dictionary[kLJMainLinkObjectStartTime] isKindOfClass:[NSNull class]]){
		self.startTime = dictionary[kLJMainLinkObjectStartTime];
	}	
	if(![dictionary[kLJMainLinkObjectStatus] isKindOfClass:[NSNull class]]){
		self.status = dictionary[kLJMainLinkObjectStatus];
	}	
	if(![dictionary[kLJMainLinkObjectThumb] isKindOfClass:[NSNull class]]){
		self.thumb = dictionary[kLJMainLinkObjectThumb];
	}	
	if(![dictionary[kLJMainLinkObjectTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kLJMainLinkObjectTitle];
	}	
	if(![dictionary[kLJMainLinkObjectUid] isKindOfClass:[NSNull class]]){
		self.uid = dictionary[kLJMainLinkObjectUid];
	}	
	if(![dictionary[kLJMainLinkObjectVideo] isKindOfClass:[NSNull class]]){
		self.video = dictionary[kLJMainLinkObjectVideo];
	}	
	if(![dictionary[kLJMainLinkObjectVideoQuality] isKindOfClass:[NSNull class]]){
		self.videoQuality = dictionary[kLJMainLinkObjectVideoQuality];
	}	
	if(![dictionary[kLJMainLinkObjectView] isKindOfClass:[NSNull class]]){
		self.view = dictionary[kLJMainLinkObjectView];
	}	
	if(![dictionary[kLJMainLinkObjectWeight] isKindOfClass:[NSNull class]]){
		self.weight = dictionary[kLJMainLinkObjectWeight];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.announcement != nil){
		dictionary[kLJMainLinkObjectAnnouncement] = self.announcement;
	}
	if(self.appShufflingImage != nil){
		dictionary[kLJMainLinkObjectAppShufflingImage] = self.appShufflingImage;
	}
	if(self.avatar != nil){
		dictionary[kLJMainLinkObjectAvatar] = self.avatar;
	}
	if(self.beautyCover != nil){
		dictionary[kLJMainLinkObjectBeautyCover] = self.beautyCover;
	}
	if(self.categoryId != nil){
		dictionary[kLJMainLinkObjectCategoryId] = self.categoryId;
	}
	if(self.categoryName != nil){
		dictionary[kLJMainLinkObjectCategoryName] = self.categoryName;
	}
	if(self.categorySlug != nil){
		dictionary[kLJMainLinkObjectCategorySlug] = self.categorySlug;
	}
	if(self.createAt != nil){
		dictionary[kLJMainLinkObjectCreateAt] = self.createAt;
	}
	if(self.defaultImage != nil){
		dictionary[kLJMainLinkObjectDefaultImage] = self.defaultImage;
	}
	if(self.follow != nil){
		dictionary[kLJMainLinkObjectFollow] = self.follow;
	}
	if(self.grade != nil){
		dictionary[kLJMainLinkObjectGrade] = self.grade;
	}
	dictionary[kLJMainLinkObjectHidden] = @(self.hidden);
	if(self.intro != nil){
		dictionary[kLJMainLinkObjectIntro] = self.intro;
	}
	if(self.level != nil){
		dictionary[kLJMainLinkObjectLevel] = self.level;
	}
	if(self.like != nil){
		dictionary[kLJMainLinkObjectLike] = self.like;
	}
	if(self.loveCover != nil){
		dictionary[kLJMainLinkObjectLoveCover] = self.loveCover;
	}
	if(self.nick != nil){
		dictionary[kLJMainLinkObjectNick] = self.nick;
	}
	if(self.playAt != nil){
		dictionary[kLJMainLinkObjectPlayAt] = self.playAt;
	}
	if(self.recommendImage != nil){
		dictionary[kLJMainLinkObjectRecommendImage] = self.recommendImage;
	}
	dictionary[kLJMainLinkObjectScreen] = @(self.screen);
	if(self.slug != nil){
		dictionary[kLJMainLinkObjectSlug] = self.slug;
	}
	if(self.startTime != nil){
		dictionary[kLJMainLinkObjectStartTime] = self.startTime;
	}
	if(self.status != nil){
		dictionary[kLJMainLinkObjectStatus] = self.status;
	}
	if(self.thumb != nil){
		dictionary[kLJMainLinkObjectThumb] = self.thumb;
	}
	if(self.title != nil){
		dictionary[kLJMainLinkObjectTitle] = self.title;
	}
	if(self.uid != nil){
		dictionary[kLJMainLinkObjectUid] = self.uid;
	}
	if(self.video != nil){
		dictionary[kLJMainLinkObjectVideo] = self.video;
	}
	if(self.videoQuality != nil){
		dictionary[kLJMainLinkObjectVideoQuality] = self.videoQuality;
	}
	if(self.view != nil){
		dictionary[kLJMainLinkObjectView] = self.view;
	}
	if(self.weight != nil){
		dictionary[kLJMainLinkObjectWeight] = self.weight;
	}
	return dictionary;

}

@end