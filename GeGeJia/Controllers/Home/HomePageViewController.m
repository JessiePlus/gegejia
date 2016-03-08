//
//  HomePage.m
//  GeGeJia
//
//  Created by dinglin on 16/2/28.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "HomePageViewController.h"
#import <MJRefresh/MJRefresh.h>
#import <Masonry/Masonry.h>
#import <AFHTTPSessionManager.h>
#import "DataModels.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "BannerView.h"
#import "ActivityCell.h"


static NSString *const kCellID = @"Cell";
static NSString *const kOnSaleCellID = @"OnSaleCell";


@interface HomePageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{

}



//内容
@property (nonatomic) UICollectionView *mainView;//主视图
//@property (nonatomic) BannerView *banner;
//@property (nonatomic) NSArray *hotList;
@property (nonatomic) NSArray *activityList;

@end

@implementation HomePageViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    //layout
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumInteritemSpacing = 10.0f;
    flowLayout.minimumLineSpacing = 10.0f;
    
    //collectionView
    _mainView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [_mainView registerClass:[ActivityCell class] forCellWithReuseIdentifier:kOnSaleCellID];
    _mainView.delegate = self;
    _mainView.dataSource = self;

    
//    _banner = [BannerView new];
//    _banner.frame = CGRectMake(0, 0, 375, 200);
    

    [self.view addSubview:_mainView];
    
    NSString *URLString = @"http://app.gegejia.com/yangege/appNative/resource/homeList";
    NSDictionary *parameters = @{@"os": @"1",
                                 @"params": @"{\"type\":\"124569\"}",
                                 @"remark": @"isVestUpdate35",
                                 @"sign": @"4435912AAF47B2C3",
                                 @"version": @"2.3"
                                 };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"%d, %@", __LINE__, uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BaseNSObject *base = [BaseNSObject modelObjectWithDictionary:responseObject];
        
        NSError *error;
        NSData *data = [base.params dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *paramDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        HomePageNSObject *homePage = [HomePageNSObject modelObjectWithDictionary:paramDic];
        
        //广告板
//        _banner.bannerList = homePage.bannerList;
   
//        for (HomePageActivityList *activityList in homePage.activityList) {
//            NSLog(@"%@", activityList.title);
//            
//            for (HomePageContent *content in activityList.content) {
//                NSLog(@"%@", content);
//            }
//        }
        _activityList = homePage.activityList;
//        for (HomePageHotList *hotList in homePage.hotList) {
//            NSLog(@"%d, %@", __LINE__, hotList);
//        }
//        _hotList = homePage.hotList;
        
//        HomePageNowGegeRecommend *NowGegeRecommend = homePage.nowGegeRecommend;
//        NSLog(@"%@", NowGegeRecommend.title);
//        for (NSString *content in NowGegeRecommend.content) {
//            NSLog(@"%@", content);
//        }
        NSLog(@"%ld", [_activityList count]);
        [_mainView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
    }];
   

}

#pragma mark - 内容

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake([((HomePageContent *)((HomePageActivityList *)_activityList[indexPath.section]).content[indexPath.row]).width floatValue]/2, [((HomePageContent *)((HomePageActivityList *)_activityList[indexPath.section]).content[indexPath.row]).height floatValue]/2);
    return size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [((HomePageActivityList *)_activityList[section]).content count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ActivityCell *cell =
    (ActivityCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kOnSaleCellID
                                                                                forIndexPath:indexPath];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:((HomePageContent *)((HomePageActivityList *)_activityList[indexPath.section]).content[indexPath.row]).image]];
    
    cell.contentView.backgroundColor = [UIColor yellowColor];
    NSLog(@"%ld, %ld, %@, %@", indexPath.section, indexPath.item, NSStringFromCGRect(cell.contentView.frame), NSStringFromCGRect(cell.image.frame));
    
    
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [_activityList count];
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//
//}




@end
