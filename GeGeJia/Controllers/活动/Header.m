//
//  Header.m
//  GeGeJia
//
//  Created by dinglin on 16/3/8.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "Header.h"
#import <Masonry.h>
#import "UIColor+Util.h"

@interface Header () {
}
@property (nonatomic) UIView *redLine;
@end

@implementation Header
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
//    self.backgroundColor = [UIColor orangeColor];
    _redLine = [UIView new];
    _redLine.backgroundColor = [UIColor titleColor];
    _label = [UILabel new];
    [self addSubview:_redLine];
    [self addSubview:_label];
}

- (void)setLayout
{
    [_redLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@2);
        make.height.equalTo(@15);
    }];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_redLine.mas_right).offset(3);
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@15);
    }];
}
@end
