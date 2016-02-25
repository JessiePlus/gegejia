//
//  UIScrollView+TouchEvent.m
//  GeGeJia
//
//  Created by dinglin on 16/2/25.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "UIScrollView+TouchEvent.h"

@implementation UIScrollView (TouchEvent)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return  YES;
}

@end
