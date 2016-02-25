//
//  pageControlTableViewCell.m
//  GeGeJia
//
//  Created by dinglin on 16/2/24.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "pageControlTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIScrollView+TouchEvent.h"

@interface pageControlTableViewCell () <UIScrollViewDelegate> {
    
}

@end


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
    pageControl.hidesForSinglePage = YES;
    pageControl.backgroundColor = [UIColor purpleColor];
    
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor greenColor];
    
    UIImageView *picture1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll1.png"]];
    UIImageView *picture2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll2.png"]];
    UIImageView *picture3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll3.png"]];
    picture1.userInteractionEnabled = YES;
    picture2.userInteractionEnabled = YES;
    picture3.userInteractionEnabled = YES;
    picture1.frame = CGRectMake(0, 0, 375, 100);
    picture2.frame = CGRectMake(375, 0, 375, 100);
    picture3.frame = CGRectMake(375*2, 0, 375, 100);

    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375*3, 100)];
    contentView.backgroundColor = [UIColor purpleColor];
    [contentView addSubview:picture1];
    [contentView addSubview:picture2];
    [contentView addSubview:picture3];

    scrollView.contentSize = CGSizeMake(375*3, 100);//contentView.bounds.size;
    [scrollView addSubview:contentView];
    [self.contentView addSubview:scrollView];
    [self.contentView addSubview:pageControl];
   
    scrollView.frame = picture1.frame;
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView);
//    }];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.width.equalTo(self.contentView.mas_width).multipliedBy(0.25f);
        make.height.equalTo(self.contentView.mas_height).multipliedBy(0.25f);
        
        
    }];
    
    self.contentView.backgroundColor = [UIColor greenColor];
    return self;
    
}



@end
