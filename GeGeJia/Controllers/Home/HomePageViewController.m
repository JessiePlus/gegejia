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
#import "Header.h"
#import "TodayHotView.h"


static NSString *const kCellID = @"CellID";
static NSString *const kActivityCellID = @"ActivityCellID";
static NSString *const kTodayHotCellID = @"TodayHotCellID";
static NSString *const kCollectionViewHeaderIndentifier = @"CollectionViewHeaderID";
static NSString *const kCollectionViewFooterIndentifier = @"CollectionViewFooterID";
#define kSCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define kSCREENFACTOR (kSCREENWIDTH/710.0f)

@interface HomePageViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{

}



//内容
@property (nonatomic) UICollectionView *mainView;//主视图
//@property (nonatomic) BannerView *banner;
@property (nonatomic) NSArray *hotList;
@property (nonatomic) NSArray *activityList;

@end

@implementation HomePageViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    
    
    //1.
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing = 5.0f;
    
    //collectionView
    _mainView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    [_mainView registerClass:[ActivityCell class] forCellWithReuseIdentifier:kActivityCellID];
    [_mainView registerClass:[TodayHotView class] forCellWithReuseIdentifier:kTodayHotCellID];
    [_mainView registerClass:[Header class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCollectionViewHeaderIndentifier];
    
    _mainView.delegate = self;
    _mainView.dataSource = self;
    _mainView.backgroundColor = [UIColor whiteColor];

    
//    _banner = [BannerView new];
//    _banner.frame = CGRectMake(0, 0, 375, 200);
    

    [self.view addSubview:_mainView];
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    //2.
    
    
    
    
    
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
        _hotList = homePage.hotList;
        
//        HomePageNowGegeRecommend *NowGegeRecommend = homePage.nowGegeRecommend;
//        NSLog(@"%@", NowGegeRecommend.title);
//        for (NSString *content in NowGegeRecommend.content) {
//            NSLog(@"%@", content);
//        }
        [_mainView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
    }];
   

}

#pragma mark - 内容

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size;
    if (indexPath.section < _activityList.count) {
        size = CGSizeMake([((HomePageContent *)((HomePageActivityList *)_activityList[indexPath.section]).content[indexPath.row]).width floatValue]*kSCREENFACTOR, [((HomePageContent *)((HomePageActivityList *)_activityList[indexPath.section]).content[indexPath.row]).height floatValue]*kSCREENFACTOR);
    } else if (indexPath.section == _activityList.count){
        size = CGSizeMake(kSCREENWIDTH, 200);
    }
    return size;
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section < _activityList.count) {
        return [((HomePageActivityList *)_activityList[section]).content count];
    } else if (section == _activityList.count){
        return 1;
    } else {
        return 0;
    }
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < _activityList.count) {
        ActivityCell *cell =
        (ActivityCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kActivityCellID
                                                                  forIndexPath:indexPath];
        [cell.image sd_setImageWithURL:[NSURL URLWithString:((HomePageContent *)((HomePageActivityList *)_activityList[indexPath.section]).content[indexPath.row]).image] placeholderImage:[UIImage imageNamed:@"home_default_goods"]];
        
        return cell;
    } else if (indexPath.section == _activityList.count){
        TodayHotView *cell =
        (TodayHotView *)[collectionView dequeueReusableCellWithReuseIdentifier:kTodayHotCellID
                                                                  forIndexPath:indexPath];
        cell.hotList = _hotList;
        return cell;
    }
    else {
        return nil;
    }
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return ([_activityList count] + ((_hotList.count > 0)?1:0));
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath{

    NSString *resueIndentifier = kCollectionViewHeaderIndentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        resueIndentifier = kCollectionViewFooterIndentifier;
    }
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:resueIndentifier forIndexPath:indexPath];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        Header *header = (Header *)view;
        if (indexPath.section < _activityList.count) {
            header.label.text = ((HomePageActivityList *)_activityList[indexPath.section]).title;
        } else if (indexPath.section == _activityList.count) {
            header.label.text = @"今日最热";
        }
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        
    }
    return  view;
}

-(CGSize) collectionView:(UICollectionView *) collectionView
                  layout:(UICollectionViewLayout *) collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger) section
{
    if (section < _activityList.count) {
        if (((HomePageActivityList *)_activityList[section]).title.length == 0) {
            return CGSizeZero;
        } else {
            return CGSizeMake(kSCREENWIDTH, 20.0f);
        }
    } else if (section == _activityList.count) {
        return CGSizeMake(kSCREENWIDTH, 20.0f);
    } else {
        return CGSizeZero;
    }
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

@end
