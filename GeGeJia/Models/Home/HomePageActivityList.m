//
//  HomePageActivityList.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomePageActivityList.h"
#import "HomePageContent.h"


NSString *const kHomePageActivityListTitle = @"title";
NSString *const kHomePageActivityListContent = @"content";


@interface HomePageActivityList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomePageActivityList

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
            self.title = [self objectOrNilForKey:kHomePageActivityListTitle fromDictionary:dict];
    NSObject *receivedHomePageContent = [dict objectForKey:kHomePageActivityListContent];
    NSMutableArray *parsedHomePageContent = [NSMutableArray array];
    if ([receivedHomePageContent isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHomePageContent) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHomePageContent addObject:[HomePageContent modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHomePageContent isKindOfClass:[NSDictionary class]]) {
       [parsedHomePageContent addObject:[HomePageContent modelObjectWithDictionary:(NSDictionary *)receivedHomePageContent]];
    }

    self.content = [NSArray arrayWithArray:parsedHomePageContent];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kHomePageActivityListTitle];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForContent] forKey:kHomePageActivityListContent];

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

    self.title = [aDecoder decodeObjectForKey:kHomePageActivityListTitle];
    self.content = [aDecoder decodeObjectForKey:kHomePageActivityListContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kHomePageActivityListTitle];
    [aCoder encodeObject:_content forKey:kHomePageActivityListContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomePageActivityList *copy = [[HomePageActivityList alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
    }
    
    return copy;
}


@end
