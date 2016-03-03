//
//  HomePageContent.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HomePageContent.h"


NSString *const kHomePageContentHeight = @"height";
NSString *const kHomePageContentId = @"id";
NSString *const kHomePageContentDisplayType = @"displayType";
NSString *const kHomePageContentType = @"type";
NSString *const kHomePageContentWidth = @"width";
NSString *const kHomePageContentImage = @"image";


@interface HomePageContent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HomePageContent

@synthesize height = _height;
@synthesize contentIdentifier = _contentIdentifier;
@synthesize displayType = _displayType;
@synthesize type = _type;
@synthesize width = _width;
@synthesize image = _image;


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
            self.height = [self objectOrNilForKey:kHomePageContentHeight fromDictionary:dict];
            self.contentIdentifier = [self objectOrNilForKey:kHomePageContentId fromDictionary:dict];
            self.displayType = [self objectOrNilForKey:kHomePageContentDisplayType fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHomePageContentType fromDictionary:dict];
            self.width = [self objectOrNilForKey:kHomePageContentWidth fromDictionary:dict];
            self.image = [self objectOrNilForKey:kHomePageContentImage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.height forKey:kHomePageContentHeight];
    [mutableDict setValue:self.contentIdentifier forKey:kHomePageContentId];
    [mutableDict setValue:self.displayType forKey:kHomePageContentDisplayType];
    [mutableDict setValue:self.type forKey:kHomePageContentType];
    [mutableDict setValue:self.width forKey:kHomePageContentWidth];
    [mutableDict setValue:self.image forKey:kHomePageContentImage];

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

    self.height = [aDecoder decodeObjectForKey:kHomePageContentHeight];
    self.contentIdentifier = [aDecoder decodeObjectForKey:kHomePageContentId];
    self.displayType = [aDecoder decodeObjectForKey:kHomePageContentDisplayType];
    self.type = [aDecoder decodeObjectForKey:kHomePageContentType];
    self.width = [aDecoder decodeObjectForKey:kHomePageContentWidth];
    self.image = [aDecoder decodeObjectForKey:kHomePageContentImage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_height forKey:kHomePageContentHeight];
    [aCoder encodeObject:_contentIdentifier forKey:kHomePageContentId];
    [aCoder encodeObject:_displayType forKey:kHomePageContentDisplayType];
    [aCoder encodeObject:_type forKey:kHomePageContentType];
    [aCoder encodeObject:_width forKey:kHomePageContentWidth];
    [aCoder encodeObject:_image forKey:kHomePageContentImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    HomePageContent *copy = [[HomePageContent alloc] init];
    
    if (copy) {

        copy.height = [self.height copyWithZone:zone];
        copy.contentIdentifier = [self.contentIdentifier copyWithZone:zone];
        copy.displayType = [self.displayType copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
    }
    
    return copy;
}


@end
