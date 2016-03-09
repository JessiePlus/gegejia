//
//  HomePageBannerList.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomePageBannerList.h"


NSString *const kHomePageBannerListId = @"id";
NSString *const kHomePageBannerListType = @"type";
NSString *const kHomePageBannerListImage = @"image";
NSString *const kHomePageBannerListCommonActivitiesName = @"commonActivitiesName";


@interface HomePageBannerList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomePageBannerList

@synthesize bannerListIdentifier = _bannerListIdentifier;
@synthesize type = _type;
@synthesize image = _image;
@synthesize commonActivitiesName = _commonActivitiesName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.bannerListIdentifier = [self objectOrNilForKey:kHomePageBannerListId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHomePageBannerListType fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHomePageBannerListImage fromDictionary:dict];
            self.commonActivitiesName = [self objectOrNilForKey:kHomePageBannerListCommonActivitiesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.bannerListIdentifier forKey:kHomePageBannerListId];
    [mutableDict setValue:self.type forKey:kHomePageBannerListType];
    [mutableDict setValue:self.image forKey:kHomePageBannerListImage];
    [mutableDict setValue:self.commonActivitiesName forKey:kHomePageBannerListCommonActivitiesName];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.bannerListIdentifier = [aDecoder decodeObjectForKey:kHomePageBannerListId];
    self.type = [aDecoder decodeObjectForKey:kHomePageBannerListType];
    self.image = [aDecoder decodeObjectForKey:kHomePageBannerListImage];
    self.commonActivitiesName = [aDecoder decodeObjectForKey:kHomePageBannerListCommonActivitiesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bannerListIdentifier forKey:kHomePageBannerListId];
    [aCoder encodeObject:_type forKey:kHomePageBannerListType];
    [aCoder encodeObject:_image forKey:kHomePageBannerListImage];
    [aCoder encodeObject:_commonActivitiesName forKey:kHomePageBannerListCommonActivitiesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomePageBannerList *copy = [[HomePageBannerList alloc] init];
    
    if (copy) {

        copy.bannerListIdentifier = [self.bannerListIdentifier copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.commonActivitiesName = [self.commonActivitiesName copyWithZone:zone];
    }
    
    return copy;
}


@end
