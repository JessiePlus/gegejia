//
//  HomePageHotList.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomePageHotList.h"


NSString *const kHomePageHotListId = @"id";
NSString *const kHomePageHotListTitle = @"title";
NSString *const kHomePageHotListImage = @"image";
NSString *const kHomePageHotListPrice = @"price";
NSString *const kHomePageHotListType = @"type";


@interface HomePageHotList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomePageHotList

@synthesize hotListIdentifier = _hotListIdentifier;
@synthesize title = _title;
@synthesize image = _image;
@synthesize price = _price;
@synthesize type = _type;


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
            self.hotListIdentifier = [self objectOrNilForKey:kHomePageHotListId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kHomePageHotListTitle fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHomePageHotListImage fromDictionary:dict];
            self.price = [self objectOrNilForKey:kHomePageHotListPrice fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHomePageHotListType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.hotListIdentifier forKey:kHomePageHotListId];
    [mutableDict setValue:self.title forKey:kHomePageHotListTitle];
    [mutableDict setValue:self.image forKey:kHomePageHotListImage];
    [mutableDict setValue:self.price forKey:kHomePageHotListPrice];
    [mutableDict setValue:self.type forKey:kHomePageHotListType];

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

    self.hotListIdentifier = [aDecoder decodeObjectForKey:kHomePageHotListId];
    self.title = [aDecoder decodeObjectForKey:kHomePageHotListTitle];
    self.image = [aDecoder decodeObjectForKey:kHomePageHotListImage];
    self.price = [aDecoder decodeObjectForKey:kHomePageHotListPrice];
    self.type = [aDecoder decodeObjectForKey:kHomePageHotListType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hotListIdentifier forKey:kHomePageHotListId];
    [aCoder encodeObject:_title forKey:kHomePageHotListTitle];
    [aCoder encodeObject:_image forKey:kHomePageHotListImage];
    [aCoder encodeObject:_price forKey:kHomePageHotListPrice];
    [aCoder encodeObject:_type forKey:kHomePageHotListType];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomePageHotList *copy = [[HomePageHotList alloc] init];
    
    if (copy) {

        copy.hotListIdentifier = [self.hotListIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.price = [self.price copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
