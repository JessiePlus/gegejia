//
//  OnSaleCell.m
//  GeGeJia
//
//  Created by dinglin on 16/3/6.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "ActivityCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry.h>

@interface ActivityCell () {
}

@end

@implementation ActivityCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        [self setLayout];
    }
    return self;
}


- (void)initSubviews
{

    
    _image = [UIImageView new];
    _image.userInteractionEnabled = YES;
    _image.contentMode = UIViewContentModeScaleToFill;
//    _image.frame = self.contentView.bounds;
//    NSLog(@"%d, %@", __LINE__, NSStringFromCGRect((_image.frame)));
    [self.contentView addSubview:_image];
//    _image.backgroundColor = [UIColor greenColor];
}

- (void)setLayout
{
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

@end
