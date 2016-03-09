//
//  GridViewCell.m
//  GeGeJia
//
//  Created by dinglin on 16/3/9.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "DoubleLineGridCell.h"
#import "GridItem.h"
#import <Masonry.h>
#import "UIColor+Util.h"

@interface DoubleLineGridCell () {

}

@end
@implementation DoubleLineGridCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier];
    if (self) {
        [self initSubviews];
        [self setLayout];
    }
    return self;
}
-(void) initSubviews {
    
    NSArray *images = @[@"user_signin", @"user_fav", @"myCoupons", @"myIntegral", \
                        @"user_invite", @"user_contact", @"user_feedback", @"user_about"];
    NSArray *titles = @[@"签到", @"收藏", @"优惠券", @"积分", \
                        @"邀请小伙伴", @"客服与帮助", @"意见与反馈", @"关于格格家"];
    NSArray *subTitles = @[@"领取今日奖励", @"", @"兑换优惠券", @"", \
                           @"返现金", @"", @"", @""];
    
    NSMutableArray *items = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < images.count; i ++) {
        GridItem *item = [GridItem new];
        item.imageUrl = images[i];
        item.title = titles[i];
        item.subTitle = subTitles[i];
        [items addObject:item];
    }
    
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width)/4;
    CGFloat itemHeight = 100;//self.contentView.bounds.size.height;
    
    for (NSUInteger i = 0; i < items.count; i ++) {
        UIView *item = [[UIView alloc] initWithFrame:CGRectMake((i%4)*itemWidth, (i/4)*100, itemWidth, itemHeight)];
        item.layer.borderWidth = 0.3f;
        item.layer.borderColor  = [UIColor lineColor].CGColor;
//        NSLog(@"%f %f %f", itemWidth, itemHeight, self.bounds.size.height);
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:((GridItem *)items[i]).imageUrl]];



        UILabel *title = [UILabel new];
        title.text = ((GridItem *)items[i]).title;
        title.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
        title.textAlignment = NSTextAlignmentCenter;

        
        UILabel *subTitle = [UILabel new];
        subTitle.text = ((GridItem *)items[i]).subTitle;
        subTitle.font = [UIFont fontWithName:@"HelveticaNeue" size:8];
        subTitle.textAlignment = NSTextAlignmentCenter;
        subTitle.textColor = [UIColor lightGrayColor];

        
        [item addSubview:image];
        [item addSubview:title];
        [item addSubview:subTitle];
        [self.contentView addSubview:item];
        
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(item.mas_centerX);
            make.top.equalTo(item.mas_top).offset(itemHeight*1.0/4);
            make.width.equalTo(item.mas_width).multipliedBy(1.3/4);
            make.height.equalTo(item.mas_height).multipliedBy(1.3/4);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(item.mas_centerX);
            make.top.equalTo(image.mas_bottom).offset(3.0);
            make.width.equalTo(item.mas_width);
            make.height.equalTo(item.mas_height).multipliedBy(0.6/4);
        }];
        [subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(item.mas_centerX);
            make.top.equalTo(title.mas_bottom);//.offset(1.0);
            make.width.equalTo(item.mas_width);
            make.height.equalTo(item.mas_height).multipliedBy(0.5/4);
        }];
    }
}
-(void) setLayout {
    
}


@end

