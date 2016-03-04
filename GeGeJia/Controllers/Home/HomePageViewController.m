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
#import "REPagedScrollView.h"
#import <AFHTTPSessionManager.h>
#import "DataModels.h"
#import <SDWebImage/UIImageView+WebCache.h>

static NSString *const kScrollCellID = @"ScrollCell";
static NSString *const kCellID = @"Cell";


@interface HomePageViewController () <UITableViewDataSource, UITableViewDelegate>{

}
//滚动广告
//@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) REPagedScrollView *scrollView;

//内容
@property (nonatomic) UITableView *table;

@end

@implementation HomePageViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    _table = [UITableView new];
    _table.delegate = self;
    _table.dataSource = self;
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
    
    __unsafe_unretained UITableView *tableView = _table;
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_header endRefreshing];
        });
    }];
//    [tableView.mj_header ];
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_footer endRefreshing];
        });
    }];
    
    _scrollView = [[REPagedScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    _scrollView.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _scrollView.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    
    
    UIImageView *banner1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    [_scrollView addPage:banner1];
    
    UIImageView *banner2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    [_scrollView addPage:banner2];
    
    UIImageView *banner3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    [_scrollView addPage:banner3];
    
    UIImageView *banner4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    [_scrollView addPage:banner4];
    
    NSArray *banners = @[banner1, banner2, banner3, banner4];

    
    [self.view addSubview:_table];
    _table.tableHeaderView = _scrollView;
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    
    
    
    
    
    
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
        NSLog(@"%d, %@", __LINE__, uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        BaseNSObject *base = [BaseNSObject modelObjectWithDictionary:responseObject];
        
        NSError *error;
        NSData *data = [base.params dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *paramDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        HomePageNSObject *homePage = [HomePageNSObject modelObjectWithDictionary:paramDic];
        
        
        [homePage.bannerList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [banners[idx] sd_setImageWithURL:[NSURL URLWithString:((HomePageBannerList *)obj).image]];
        }];
        
        for (HomePageActivityList *activityList in homePage.activityList) {
            NSLog(@"%@", activityList.title);
            
            for (HomePageContent *content in activityList.content) {
                NSLog(@"%@", content);
            }
        }
        for (HomePageHotList *hotList in homePage.hotList) {
            NSLog(@"%@", hotList);
        }
        
        HomePageNowGegeRecommend *NowGegeRecommend = homePage.nowGegeRecommend;
        NSLog(@"%@", NowGegeRecommend.title);
        for (NSString *content in NowGegeRecommend.content) {
            NSLog(@"%@", content);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
    }];
    
    
    
    
    

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int num = -1;
    if (section == 0)
        num = 1;
    else if (section == 1)
        num = 3;
    
    return num;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_table dequeueReusableCellWithIdentifier:kCellID forIndexPath:indexPath];

    return cell;
}

@end
