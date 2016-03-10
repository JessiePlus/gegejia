//
//  BannersView.m
//  GeGeJia
//
//  Created by dinglin on 16/3/10.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "BannersView.h"
#import <Masonry.h>
#import "UIColor+Util.h"
#import "SDCycleScrollView.h"

@interface BannersView ()
@property (nonatomic) SDCycleScrollView *cycleScrollView;
@end

@implementation BannersView
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
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imageURLStringsGroup:_imagesURLStrings];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.delegate = (id)self;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.contentView addSubview:_cycleScrollView];
}

- (void)setLayout
{
}
-(void)setImagesURLStrings:(NSArray *)imagesURLStrings {
    _imagesURLStrings = imagesURLStrings;
    _cycleScrollView.imageURLStringsGroup = _imagesURLStrings;    
}
@end
