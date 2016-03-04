//
//  BaseNSObject.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseNSObject.h"


NSString *const kBaseNSObjectStatus = @"status";
NSString *const kBaseNSObjectParams = @"params";


@interface BaseNSObject ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseNSObject

@synthesize status = _status;
@synthesize params = _params;


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
            self.status = [self objectOrNilForKey:kBaseNSObjectStatus fromDictionary:dict];
            self.params = [self objectOrNilForKey:kBaseNSObjectParams fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kBaseNSObjectStatus];
    [mutableDict setValue:self.params forKey:kBaseNSObjectParams];

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

    self.status = [aDecoder decodeObjectForKey:kBaseNSObjectStatus];
    self.params = [aDecoder decodeObjectForKey:kBaseNSObjectParams];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kBaseNSObjectStatus];
    [aCoder encodeObject:_params forKey:kBaseNSObjectParams];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseNSObject *copy = [[BaseNSObject alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.params = [self.params copyWithZone:zone];
    }
    
    return copy;
}


@end
