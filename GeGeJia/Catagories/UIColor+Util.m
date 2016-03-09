//
//  UIColor+Util.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)
#pragma mark - theme colors
+ (UIColor *)titleColor
{
    return [UIColor colorWithRed:238/255.0f  green:100/255.0f  blue:87/255.0f alpha:1.0f];
}
+ (UIColor *)themeColor
{
    return [UIColor colorWithRed:255/255.0f  green:255/255.0f  blue:255/255.0f alpha:1.0f];
}
+ (UIColor *)moneyColor
{
    return [UIColor colorWithRed:207/255.0f  green:52/255.0f  blue:41/255.0f alpha:1.0f];
}
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}
+ (UIColor *)colorWithHex:(int)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}
@end
