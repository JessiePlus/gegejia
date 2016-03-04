//
//  HomePageBannerList.h
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomePageBannerList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *bannerListIdentifier;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *commonActivitiesName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
