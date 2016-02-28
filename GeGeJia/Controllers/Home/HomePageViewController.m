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

@interface HomePageViewController () {

}
//滚动广告
@property (nonatomic) UIPageControl *pageControl;
@property (nonatomic) UIScrollView *scroll;

//内容
@property (nonatomic) UITableView *table;

@end

@implementation HomePageViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    _table = [UITableView new];
    
    
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
    
    REPagedScrollView *scrollView = [[REPagedScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    scrollView.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    scrollView.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor lightGrayColor];
    [scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor blueColor];
    [scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor greenColor];
    [scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor redColor];
    [scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor yellowColor];
    [scrollView addPage:test];
        
    [self.view addSubview:_table];
    
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        make.top.equalTo(self.view.mas_top).offset(104);
//        make.height.equalTo(@100);
//    }];
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(scrollView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
    }];


}




@end
