//
//  GridItem.h
//  GeGeJia
//
//  Created by dinglin on 16/3/9.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GridItem : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *subTitle;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic, copy) void (^block)(id sender);
@end
