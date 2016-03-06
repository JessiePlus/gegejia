//
//  BannerList.m
//  GeGeJia
//
//  Created by dinglin on 16/3/6.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "BannerViewController.h"
#import "BannerCell.h"
#import "DataModels.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>


static NSString *const kbannerCellID = @"Cell";

@interface BannerViewController () <UICollectionViewDataSource, UICollectionViewDelegate>{
    
}
//滚动广告
@property (nonatomic) UIPageControl *bannerPageControl;
@property (nonatomic) UICollectionView *bannerCollectionView;
@property (strong, nonatomic) NSTimer *timer;

@end
@implementation BannerViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, 375, 100);

    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.itemSize = CGSizeMake(375, 100);
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing = 0.0f;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _bannerCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _bannerCollectionView.collectionViewLayout = flowLayout;
    [_bannerCollectionView registerClass:[BannerCell class] forCellWithReuseIdentifier:kbannerCellID];
        
    _bannerCollectionView.dataSource = self;
    _bannerCollectionView.delegate = self;
    _bannerCollectionView.pagingEnabled = YES;
    _bannerCollectionView.bounces = NO;
    _bannerCollectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_bannerCollectionView];
    
    
    
    
    _bannerPageControl = [UIPageControl new];

    [self.view addSubview:_bannerPageControl];

    [_bannerCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_bannerPageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
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
