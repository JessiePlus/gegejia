//
//  BannerCell.m
//  GeGeJia
//
//  Created by dinglin on 16/3/6.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "BannerCell.h"

@implementation BannerCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        [self setLayout];
    }
    return self;

}

- (void)initSubviews
{
    _banner = [UIImageView new];
    _banner.userInteractionEnabled = YES;
    [self.contentView addSubview:_banner];
}

- (void)setLayout
{
    _banner.frame = self.bounds;
}
@end
