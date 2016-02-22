//
//  titleCollectionViewController.h
//  GeGeJia
//
//  Created by dinglin on 16/2/22.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleCollectionViewController : UICollectionViewController
@property (nonatomic, copy) void (^changeIndex)(NSUInteger index);
- (void)title:(NSArray *)titles;
@end
