//
//  TodayHotCell.m
//  GeGeJia
//
//  Created by dinglin on 16/3/9.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "TodayHotCell.h"
#import <Masonry.h>
#import "UIColor+Util.h"

@implementation TodayHotCell
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
//    self.contentView.backgroundColor = [UIColor yellowColor];
    _image = [UIImageView new];
    _image.userInteractionEnabled = YES;
    _image.contentMode = UIViewContentModeScaleToFill;
    _image.layer.borderWidth  = 0.5f;
    _image.layer.borderColor  = [UIColor lightGrayColor].CGColor;
    _image.layer.cornerRadius = 2.0f;
    
    
    [self.contentView addSubview:_image];
    
    _title = [UILabel new];
    [self.contentView addSubview:_title];
    
    _price = [UILabel new];
    [self.contentView addSubview:_price];
}

- (void)setLayout
{
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(5.0f/8);
    }];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_image.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(2.0f/8);
    }];
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_title.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.width.equalTo(self.contentView.mas_width);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(1.0f/8);
    }];
}
@end
