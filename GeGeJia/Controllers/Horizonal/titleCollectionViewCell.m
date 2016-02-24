//
//  titleCollectionViewCell.m
//  GeGeJia
//
//  Created by dinglin on 16/2/24.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "titleCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "Utils.h"

@interface titleCollectionViewCell() {
    UILabel *_label;
}

@end



@implementation titleCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self)
        return nil;
    
    _label = [UILabel new];
    _label.text = self.title;
    _label.textAlignment = NSTextAlignmentCenter;
    //_label.backgroundColor = [UIColor themeColor];
    //self.contentView.backgroundColor = [UIColor themeColor];
    [self.contentView addSubview:_label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    //label.frame = self.bounds;

    return self;
}

-(void)setTitle: (NSString *)title {
    _title = title;
    _label.text = title;
}



@end
