//
//  mineViewController.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "UserViewController.h"
#import <Masonry/Masonry.h>
//#import <MJRefresh/MJRefresh.h>
#import "UIViewExt.h"
#import "UIColor+Util.h"
#import "SingleLineGridCell.h"
#import "DoubleLineGridCell.h"
#import "GridItem.h"
#import "LoginViewController.h"
#import "SettingsViewController.h"
#import "RegisterViewController.h"



static NSString *const kCell = @"CellID";
static NSString *const kSingleLineGridViewCell = @"kSingleLineGridViewCellID";
static NSString *const kDoubleLineGridViewCell = @"kDoubleLineGridViewCellID";


@interface UserViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITableView *table;
@property (nonatomic) UIView *header;
@property (nonatomic) UIImageView *image;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"我的";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStylePlain target:self action:@selector(pushSettingViewController)];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;

    _table = [UITableView new];
    _table.delegate = self;
    _table.dataSource = self;
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:kCell];
    [_table registerClass:[SingleLineGridCell class] forCellReuseIdentifier:kSingleLineGridViewCell];
    [_table registerClass:[DoubleLineGridCell class] forCellReuseIdentifier:kDoubleLineGridViewCell];


    
    
    
    [self.view addSubview:_table];
    
    
    _header = [UIView new];
    _image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_tbg"]];
    UIButton *login = [UIButton new];
    [login setTitle:@"登录" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [login addTarget:self action:@selector(loginBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    login.layer.borderWidth  = 1.0f;
    login.layer.borderColor  = [UIColor whiteColor].CGColor;
    login.layer.cornerRadius = 2.0f;
    
    UIButton *regis = [UIButton new];
    [regis setTitle:@"注册" forState:UIControlStateNormal];
    [regis setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [regis addTarget:self action:@selector(regisBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    regis.layer.borderWidth  = 1.0f;
    regis.layer.borderColor  = [UIColor whiteColor].CGColor;
    regis.layer.cornerRadius = 2.0f;
    [_header addSubview:_image];
    [_header addSubview:login];
    [_header addSubview:regis];
    
    _header.frame = CGRectMake(0, 0, 375, 200);
    
    _table.tableHeaderView = _header;
    UIView *footer = [[UIView alloc]init];
    footer.backgroundColor = [UIColor lineColor];
    _table.tableFooterView = footer;
    _table.backgroundColor = [UIColor lineColor];
    _image.frame = CGRectMake(0, 0, 375, 200);

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pushSettingViewController
{
    SettingsViewController *settings = [SettingsViewController new];
    settings.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settings animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOff = scrollView.contentOffset.y + 64;
    if (yOff < 0) {
        CGFloat oldHeight = 200;
        CGFloat newHeight = 200 - yOff;
        CGFloat scale = newHeight / oldHeight;
        CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
        _image.transform = transform;
        _image.top = yOff;
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    } else if (indexPath.section == 1) {
        return 80;
    } else if (indexPath.section == 2){
        return 200;
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else if (section == 1)
        return 0;
    else
        return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"全部订单";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.layer.borderWidth = 0.3f;
        cell.layer.borderColor  = [UIColor lineColor].CGColor;
        return cell;

    } else if (indexPath.section == 1) {
        SingleLineGridCell *cell = [tableView dequeueReusableCellWithIdentifier:kSingleLineGridViewCell forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.layer.borderWidth = 0.3f;
        cell.layer.borderColor  = [UIColor lineColor].CGColor;
//        NSLog(@"--%f", cell.contentView.bounds.size.height);
//        cell.backgroundColor = [UIColor greenColor];

        return cell;

    } else {
        DoubleLineGridCell *cell = [tableView dequeueReusableCellWithIdentifier:kDoubleLineGridViewCell forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.layer.borderWidth = 0.3f;
        cell.layer.borderColor  = [UIColor lineColor].CGColor;
//        NSLog(@"--%f", cell.contentView.bounds.size.height);
        //        cell.backgroundColor = [UIColor greenColor];
        
        return cell;
    }
}

- (void)loginBtnClicked:(id)sender {
    LoginViewController *loginVC = [LoginViewController new];
    loginVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVC animated:NO];
}

- (void)regisBtnClicked:(id)sender {
    RegisterViewController *regisVC = [RegisterViewController new];
    regisVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:regisVC animated:NO];
}

@end
