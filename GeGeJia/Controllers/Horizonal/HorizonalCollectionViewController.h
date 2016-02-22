//
//  SwipableCollectionViewController.h
//  GeGeJia
//
//  Created by dinglin on 16/2/22.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizonalCollectionViewController : UICollectionViewController

@property (nonatomic, copy) void (^changeIndex)(NSUInteger index);
- (void)controllers:(NSArray *)controllers;


@end
