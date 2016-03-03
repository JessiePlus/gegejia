//
//  HomePageNSObject.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomePageNSObject.h"
#import "HomePageActivityList.h"
#import "HomePageHotList.h"
#import "HomePageNowGegeRecommend.h"
#import "HomePageBannerList.h"


NSString *const kHomePageNSObjectStatus = @"status";
NSString *const kHomePageNSObjectFunctionList = @"functionList";
NSString *const kHomePageNSObjectNowList = @"nowList";
NSString *const kHomePageNSObjectActivityList = @"activityList";
NSString *const kHomePageNSObjectHotList = @"hotList";
NSString *const kHomePageNSObjectNowGegeRecommend = @"nowGegeRecommend";
NSString *const kHomePageNSObjectBannerList = @"bannerList";


@interface HomePageNSObject ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomePageNSObject

@synthesize status = _status;
@synthesize functionList = _functionList;
@synthesize nowList = _nowList;
@synthesize activityList = _activityList;
@synthesize hotList = _hotList;
@synthesize nowGegeRecommend = _nowGegeRecommend;
@synthesize bannerList = _bannerList;


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
            self.status = [self objectOrNilForKey:kHomePageNSObjectStatus fromDictionary:dict];
            self.functionList = [self objectOrNilForKey:kHomePageNSObjectFunctionList fromDictionary:dict];
            self.nowList = [self objectOrNilForKey:kHomePageNSObjectNowList fromDictionary:dict];
    NSObject *receivedHomePageActivityList = [dict objectForKey:kHomePageNSObjectActivityList];
    NSMutableArray *parsedHomePageActivityList = [NSMutableArray array];
    if ([receivedHomePageActivityList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomePageActivityList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomePageActivityList addObject:[HomePageActivityList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomePageActivityList isKindOfClass:[NSDictionary class]]) {
       [parsedHomePageActivityList addObject:[HomePageActivityList modelObjectWithDictionary:(NSDictionary *)receivedHomePageActivityList]];
    }

    self.activityList = [NSArray arrayWithArray:parsedHomePageActivityList];
    NSObject *receivedHomePageHotList = [dict objectForKey:kHomePageNSObjectHotList];
    NSMutableArray *parsedHomePageHotList = [NSMutableArray array];
    if ([receivedHomePageHotList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomePageHotList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomePageHotList addObject:[HomePageHotList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomePageHotList isKindOfClass:[NSDictionary class]]) {
       [parsedHomePageHotList addObject:[HomePageHotList modelObjectWithDictionary:(NSDictionary *)receivedHomePageHotList]];
    }

    self.hotList = [NSArray arrayWithArray:parsedHomePageHotList];
            self.nowGegeRecommend = [HomePageNowGegeRecommend modelObjectWithDictionary:[dict objectForKey:kHomePageNSObjectNowGegeRecommend]];
    NSObject *receivedHomePageBannerList = [dict objectForKey:kHomePageNSObjectBannerList];
    NSMutableArray *parsedHomePageBannerList = [NSMutableArray array];
    if ([receivedHomePageBannerList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomePageBannerList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomePageBannerList addObject:[HomePageBannerList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomePageBannerList isKindOfClass:[NSDictionary class]]) {
       [parsedHomePageBannerList addObject:[HomePageBannerList modelObjectWithDictionary:(NSDictionary *)receivedHomePageBannerList]];
    }

    self.bannerList = [NSArray arrayWithArray:parsedHomePageBannerList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kHomePageNSObjectStatus];
    NSMutableArray *tempArrayForFunctionList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.functionList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFunctionList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFunctionList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFunctionList] forKey:kHomePageNSObjectFunctionList];
    NSMutableArray *tempArrayForNowList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.nowList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNowList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNowList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNowList] forKey:kHomePageNSObjectNowList];
    NSMutableArray *tempArrayForActivityList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.activityList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActivityList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActivityList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActivityList] forKey:kHomePageNSObjectActivityList];
    NSMutableArray *tempArrayForHotList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotList] forKey:kHomePageNSObjectHotList];
    [mutableDict setValue:[self.nowGegeRecommend dictionaryRepresentation] forKey:kHomePageNSObjectNowGegeRecommend];
    NSMutableArray *tempArrayForBannerList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.bannerList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBannerList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBannerList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBannerList] forKey:kHomePageNSObjectBannerList];

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

    self.status = [aDecoder decodeObjectForKey:kHomePageNSObjectStatus];
    self.functionList = [aDecoder decodeObjectForKey:kHomePageNSObjectFunctionList];
    self.nowList = [aDecoder decodeObjectForKey:kHomePageNSObjectNowList];
    self.activityList = [aDecoder decodeObjectForKey:kHomePageNSObjectActivityList];
    self.hotList = [aDecoder decodeObjectForKey:kHomePageNSObjectHotList];
    self.nowGegeRecommend = [aDecoder decodeObjectForKey:kHomePageNSObjectNowGegeRecommend];
    self.bannerList = [aDecoder decodeObjectForKey:kHomePageNSObjectBannerList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kHomePageNSObjectStatus];
    [aCoder encodeObject:_functionList forKey:kHomePageNSObjectFunctionList];
    [aCoder encodeObject:_nowList forKey:kHomePageNSObjectNowList];
    [aCoder encodeObject:_activityList forKey:kHomePageNSObjectActivityList];
    [aCoder encodeObject:_hotList forKey:kHomePageNSObjectHotList];
    [aCoder encodeObject:_nowGegeRecommend forKey:kHomePageNSObjectNowGegeRecommend];
    [aCoder encodeObject:_bannerList forKey:kHomePageNSObjectBannerList];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomePageNSObject *copy = [[HomePageNSObject alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.functionList = [self.functionList copyWithZone:zone];
        copy.nowList = [self.nowList copyWithZone:zone];
        copy.activityList = [self.activityList copyWithZone:zone];
        copy.hotList = [self.hotList copyWithZone:zone];
        copy.nowGegeRecommend = [self.nowGegeRecommend copyWithZone:zone];
        copy.bannerList = [self.bannerList copyWithZone:zone];
    }
    
    return copy;
}


@end
