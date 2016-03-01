//
//  mineViewController.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "userViewController.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>


static NSString *const kCellID = @"Cell";

@interface userViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *table;

@end

@implementation userViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
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
    
    
    UIView *header = [UIView new];
    UIButton *login = [UIButton new];
    login.backgroundColor = [UIColor redColor];
    UIButton *regis = [UIButton new];
    regis.backgroundColor = [UIColor redColor];
    [header addSubview:login];
    [header addSubview:regis];
    header.backgroundColor = [UIColor grayColor];
    
    
    UIView *footer = [UIView new];

    header.frame = CGRectMake(0, 0, 375, 100);
    _table.tableHeaderView = header;

    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(header.mas_right).multipliedBy(0.33f);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
        make.centerY.equalTo(header.mas_bottom).offset(-30);
    }];
    [regis mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(header.mas_right).multipliedBy(0.66f);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
        make.centerY.equalTo(header.mas_bottom).offset(-30);
    }];
    
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
