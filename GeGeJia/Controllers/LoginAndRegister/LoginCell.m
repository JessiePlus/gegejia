//
//  LoginCell.m
//  GeGeJia
//
//  Created by dinglin on 16/3/9.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "LoginCell.h"
#import "Masonry.h"

@interface LoginCell ()

@end

@implementation LoginCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier];
    if (self) {
        [self initSubviews];
        [self setLayout];
    }
    return self;
}
-(void) initSubviews {
    
    _image = [UIImageView new];
    _textInput = [UITextField new];
    
    [self.contentView addSubview:_image];
    [self.contentView addSubview:_textInput];

}
-(void) setLayout {
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@18);
        make.height.equalTo(@20);
    }];
    [_textInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_image.mas_right).offset(15);
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(self.contentView.mas_height);
    }];
}
@end
