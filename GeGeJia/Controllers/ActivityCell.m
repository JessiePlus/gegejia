//
//  OnSaleCell.m
//  GeGeJia
//
//  Created by dinglin on 16/3/6.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
    [self.contentView addSubview:_image];
    _image.backgroundColor = [UIColor greenColor];

}

- (void)setLayout
{
    _image.frame = self.bounds;
}
@end
