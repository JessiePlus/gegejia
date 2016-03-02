//
//  mineViewController.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "userViewController.h"
#import <Masonry/Masonry.h>
//#import <MJRefresh/MJRefresh.h>


static NSString *const kCellID = @"Cell";

@interface userViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *table;
@property (nonatomic) UIView *header;
@property (nonatomic) UIImageView *image;
@end

@implementation userViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"我的";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(pushSettingViewController)];
    
    
    
    _table = [UITableView new];
    _table.delegate = self;
    _table.dataSource = self;
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellID];
    
//    __unsafe_unretained UITableView *tableView = _table;
//    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        // 进入刷新状态后会自动调用这个block
//        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 结束刷新
//            [tableView.mj_header endRefreshing];
//        });
//    }];
//    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        // 进入刷新状态后会自动调用这个block
//        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            // 结束刷新
//            [tableView.mj_footer endRefreshing];
//        });
//    }];
    
    
    [self.view addSubview:_table];
    
    
    _header = [UIView new];
    _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_tbg"]];
    UIButton *login = [UIButton new];
    [login setTitle:@"登录" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    login.layer.borderWidth  = 1.0f;
    login.layer.borderColor  = [UIColor whiteColor].CGColor;
    login.layer.cornerRadius = 2.0f;
    
    UIButton *regis = [UIButton new];
    [regis setTitle:@"注册" forState:UIControlStateNormal];
    [regis setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    regis.layer.borderWidth  = 1.0f;
    regis.layer.borderColor  = [UIColor whiteColor].CGColor;
    regis.layer.cornerRadius = 2.0f;
    [_header addSubview:_image];
    [_header addSubview:login];
    [_header addSubview:regis];
    
    
    UIView *footer = [UIView new];

    _header.frame = CGRectMake(0, 0, 375, 200);
    
    _table.tableHeaderView = _header;
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_header.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(64);
//        make.width.equalTo(_header.mas_width);
        make.width.equalTo(@375);
        make.bottom.equalTo(_header.mas_bottom);
    }];
//    _image.frame = _header.bounds;
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_header.mas_right).multipliedBy(0.33f);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        make.centerY.equalTo(_header.mas_centerY);//.offset(-30);
    }];
    [regis mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_header.mas_right).multipliedBy(0.66f);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        make.centerY.equalTo(_header.mas_centerY);//.offset(-30);
    }];
    
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
        [self.view layoutIfNeeded];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushSettingViewController
{
    NSLog(@"%d", __LINE__);
    //[self.navigationController pushViewController:[SearchViewController new] animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f", scrollView.contentOffset.y);
    if (scrollView.contentOffset.y + 64 < 0) {
        CGRect rect =_image.frame;
        CGFloat factor = rect.size.height/200.0f;
//        NSLog(@"%d, %@", __LINE__, NSStringFromCGRect(rect));
//        NSLog(@"%d, %f, %f, %f", __LINE__, factor*rect.size.width, factor, rect.size.height);
//        
        
        [_image mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.width.equalTo(@(375*factor));
        }];
        [self.view layoutIfNeeded];
    }


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
