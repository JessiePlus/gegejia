//
//  HomePageNowGegeRecommend.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomePageNowGegeRecommend.h"


NSString *const kHomePageNowGegeRecommendTitle = @"title";
NSString *const kHomePageNowGegeRecommendContent = @"content";


@interface HomePageNowGegeRecommend ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomePageNowGegeRecommend

@synthesize title = _title;
@synthesize content = _content;


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
            self.title = [self objectOrNilForKey:kHomePageNowGegeRecommendTitle fromDictionary:dict];
            self.content = [self objectOrNilForKey:kHomePageNowGegeRecommendContent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kHomePageNowGegeRecommendTitle];
    NSMutableArray *tempArrayForContent = [NSMutableArray array];
    for (NSObject *subArrayObject in self.content) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForContent addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForContent addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForContent] forKey:kHomePageNowGegeRecommendContent];

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

    self.title = [aDecoder decodeObjectForKey:kHomePageNowGegeRecommendTitle];
    self.content = [aDecoder decodeObjectForKey:kHomePageNowGegeRecommendContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kHomePageNowGegeRecommendTitle];
    [aCoder encodeObject:_content forKey:kHomePageNowGegeRecommendContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomePageNowGegeRecommend *copy = [[HomePageNowGegeRecommend alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
    }
    
    return copy;
}


@end
