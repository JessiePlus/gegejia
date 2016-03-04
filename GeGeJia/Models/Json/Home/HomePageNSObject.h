//
//  HomePageNSObject.h
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomePageNowGegeRecommend;

@interface HomePageNSObject : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *functionList;
@property (nonatomic, strong) NSArray *nowList;
@property (nonatomic, strong) NSArray *activityList;
@property (nonatomic, strong) NSArray *hotList;
@property (nonatomic, strong) HomePageNowGegeRecommend *nowGegeRecommend;
@property (nonatomic, strong) NSArray *bannerList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
