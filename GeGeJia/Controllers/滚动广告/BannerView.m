//
//  BannerList.m
//  GeGeJia
//
//  Created by dinglin on 16/3/6.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "BannerView.h"
#import "BannerCell.h"
#import "DataModels.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>


static NSString *const kbannerCellID = @"Cell";

@interface BannerView () <UICollectionViewDataSource, UICollectionViewDelegate>{
    
}
//滚动广告
@property (nonatomic) UIPageControl *bannerPageControl;
@property (nonatomic) UICollectionView *bannerCollectionView;
@property (strong, nonatomic) NSTimer *timer;

@end
@implementation BannerView



-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.itemSize = CGSizeMake(375, 200);
        flowLayout.minimumInteritemSpacing = 0.0f;
        flowLayout.minimumLineSpacing = 0.0f;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _bannerCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_bannerCollectionView registerClass:[BannerCell class] forCellWithReuseIdentifier:kbannerCellID];
        
        _bannerCollectionView.dataSource = self;
        _bannerCollectionView.delegate = self;
        _bannerCollectionView.pagingEnabled = YES;
        _bannerCollectionView.bounces = NO;
        _bannerCollectionView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_bannerCollectionView];
        
        _bannerPageControl = [UIPageControl new];
        _bannerPageControl.userInteractionEnabled = NO;
        [self addSubview:_bannerPageControl];
        
        [_bannerCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_bannerPageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.centerX.equalTo(self.mas_centerX);
            make.height.equalTo(@20);
            make.width.equalTo(@200);
        }];
    
    }

    return self;
}


#pragma mark - 广告板

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _bannerList.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kbannerCellID forIndexPath:indexPath];
    [cell.banner sd_setImageWithURL:[NSURL URLWithString:((HomePageBannerList*)_bannerList[indexPath.item]).image]];
    _bannerPageControl.currentPage = indexPath.item;
    return cell;
}

-(void)setBannerList:(NSArray *)bannerList {
    _bannerList = bannerList;
    _bannerPageControl.numberOfPages = [_bannerList count];
    _bannerPageControl.currentPage = 0;
    [self.bannerCollectionView reloadData];

}


@end
