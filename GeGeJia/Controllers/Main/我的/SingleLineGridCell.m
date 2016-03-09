//
//  GridViewCell.m
//  GeGeJia
//
//  Created by dinglin on 16/3/9.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "SingleLineGridCell.h"
#import "GridItem.h"
#import <Masonry.h>

@interface SingleLineGridCell () {

}
//@property (nonatomic) UIImageView *

@end
@implementation SingleLineGridCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier];
    if (self) {
        [self initSubviews];
        [self setLayout];
    }
    return self;
}
-(void) initSubviews {
    
    NSArray *images = @[@"user_topay", @"userPendingSend", @"user_rec", @"user_done", @"userRefund"];
    NSArray *titles = @[@"待付款", @"待发货", @"待收货", @"交易成功", @"退款／退货"];
    
    NSMutableArray *items = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < images.count; i ++) {
        GridItem *item = [GridItem new];
        item.imageUrl = images[i];
        item.title = titles[i];
        [items addObject:item];
    }
//    self.items = items;
    
    NSUInteger itemNum = items.count;
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width)/itemNum;
    CGFloat itemHeight = 80;//self.contentView.bounds.size.height;
    
    for (NSUInteger i = 0; i < itemNum; i ++) {
        UIView *item = [[UIView alloc] initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, itemHeight)];
//        item.backgroundColor = [UIColor orangeColor];
//        NSLog(@"%f %f %f", itemWidth, itemHeight, self.bounds.size.height);
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:((GridItem *)items[i]).imageUrl]];
//        image.bounds = CGRectMake(0, 0, 1.0/4*itemHeight, 1.0/4*itemHeight);
//        image.center = CGPointMake(item.center.x, 1.0/4*itemHeight);
//        image.backgroundColor = [UIColor grayColor];


        UILabel *title = [UILabel new];
        title.text = ((GridItem *)items[i]).title;
        title.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
        title.textAlignment = NSTextAlignmentCenter;
//        title.backgroundColor = [UIColor yellowColor];

//        title.bounds = CGRectMake(0, 0, 1.0/4*itemHeight, 1.0/4*itemHeight);
//        title.center = CGPointMake(item.center.x, 3.0/4*itemHeight);
        
//        UILabel *subTitle = [UILabel new];
//        subTitle.text = ((GridItem *)_item[i]).subTitle;
//        subTitle.bounds = CGRectMake(0, 0, 1.0/4*itemHeight, 1.0/4*itemHeight);
//        subTitle.center = CGPointMake(item.center.x, 1.0/4*itemHeight);
        
        [item addSubview:image];
        [item addSubview:title];
//        [item addSubview:subTitle];
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
            make.height.equalTo(item.mas_height).multipliedBy(1.0/4);
        }];
    }
    
}
-(void) setLayout {
    
}


@end

