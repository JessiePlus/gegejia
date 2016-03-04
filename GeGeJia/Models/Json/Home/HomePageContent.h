//
//  HomePageContent.h
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HomePageContent : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *contentIdentifier;
@property (nonatomic, strong) NSString *displayType;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *width;
@property (nonatomic, strong) NSString *image;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
