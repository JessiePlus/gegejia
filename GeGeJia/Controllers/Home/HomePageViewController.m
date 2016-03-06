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
#import "BannerViewController.h"


static NSString *const kCellID = @"Cell";


@interface HomePageViewController () <UITableViewDataSource, UITableViewDelegate>{

}



//内容
@property (nonatomic) UITableView *table;
@property (nonatomic) BannerViewController *bannerVC;

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
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_footer endRefreshing];
        });
    }];
    
    
    


    [self.view addSubview:_table];
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _bannerVC = [BannerViewController new];
    [self addChildViewController:_bannerVC];
    _table.tableHeaderView = _bannerVC.view;
    [_bannerVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_table.mas_left);
        make.top.equalTo(_table.mas_top);
        make.width.equalTo(@375);
        make.height.equalTo(@100);
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
        
        //广告板
        _bannerVC.bannerList = homePage.bannerList;
   
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

#pragma mark - 内容

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
