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
    
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor lightGrayColor];
    [_scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor blueColor];
    [_scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor greenColor];
    [_scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor redColor];
    [_scrollView addPage:test];
    
    test = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    test.backgroundColor = [UIColor yellowColor];
    [_scrollView addPage:test];
        
    [self.view addSubview:_table];
    _table.tableHeaderView = _scrollView;
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
