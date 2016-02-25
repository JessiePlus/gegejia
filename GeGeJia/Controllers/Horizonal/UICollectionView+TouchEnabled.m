//
//  UICollectionView+TouchEnabled.m
//  GeGeJia
//
//  Created by dinglin on 16/2/25.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "UICollectionView+TouchEnabled.h"

@implementation UICollectionView (TouchEnabled)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    NSLog(@"%s, %@", __FILE__, NSStringFromClass([touch.view class]));
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UIImageView"]) {
        return NO;
    }
    return  YES;
}


@end
