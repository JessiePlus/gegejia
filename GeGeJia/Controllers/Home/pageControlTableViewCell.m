//
//  pageControlTableViewCell.m
//  GeGeJia
//
//  Created by dinglin on 16/2/24.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "pageControlTableViewCell.h"

@implementation pageControlTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self)
        return nil;
    UIPageControl *pageControl = [UIPageControl new];
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    
    [self.contentView addSubview:pageControl];
    
    
    
    return self;
    
}
@end
