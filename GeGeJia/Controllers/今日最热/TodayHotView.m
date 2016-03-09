//
//  TodayHotView2.m
//  GeGeJia
//
//  Created by dinglin on 16/3/9.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "TodayHotView.h"
#import "TodayHotCell.h"
#import "HomePageHotList.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>
#import "UIColor+Util.h"


@interface TodayHotView () <UICollectionViewDataSource, UICollectionViewDelegate>{
    
}
@property (nonatomic) UICollectionView *todayHot;

@end
@implementation TodayHotView

static NSString *const kTodayHotCellID = @"Cell";

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
        [self setLayout];
    }
    return self;
}

- (void)initSubviews
{
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake(80, 150);
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing = 5.0f;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _todayHot = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _todayHot.backgroundColor = [UIColor themeColor];
    _todayHot.bounces = NO;
    [_todayHot registerClass:[TodayHotCell class] forCellWithReuseIdentifier:kTodayHotCellID];
    
    _todayHot.dataSource = self;
    _todayHot.delegate = self;

    [self addSubview:_todayHot];
    
    [_todayHot registerClass:[TodayHotCell class] forCellWithReuseIdentifier:kTodayHotCellID];

}

- (void)setLayout
{
    [_todayHot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _hotList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TodayHotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTodayHotCellID forIndexPath:indexPath];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:((HomePageHotList *)_hotList[indexPath.item]).image]];
    
    cell.title.text = ((HomePageHotList *)_hotList[indexPath.item]).title;
    cell.title.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    cell.title.numberOfLines = 2;
    cell.title.lineBreakMode = NSLineBreakByWordWrapping;
    
    cell.price.text = [NSString stringWithFormat:@"¥ %@", ((HomePageHotList *)_hotList[indexPath.item]).price];
    cell.price.textColor = [UIColor moneyColor];
    
    
    return cell;
}

-(void)setHotList:(NSArray *)hotList {
    _hotList = hotList;
    
    [_todayHot reloadData];
    
}
@end
