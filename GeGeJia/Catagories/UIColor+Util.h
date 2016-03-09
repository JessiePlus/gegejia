//
//  UIColor+Util.h
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)
+ (UIColor *)titleColor;
+ (UIColor *)themeColor;
+ (UIColor *)moneyColor;
+ (UIColor *)lineColor;
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;
@end
