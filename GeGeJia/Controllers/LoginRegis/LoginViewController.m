//
//  Login.m
//  GeGeJia
//
//  Created by dinglin on 16/2/29.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginCell.h"
#import "Masonry.h"
#import "UIColor+Util.h"

@interface LoginViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) UITextField *accountField;
@property (nonatomic) UITextField *passwordField;
@property (nonatomic) UIButton *loginButton;

//@property (nonatomic) UIButton *qqButton;
//@property (nonatomic) UIButton *wechatButton;
@end
static NSString *const kCell = @"CellID";

@implementation LoginViewController
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"登录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"快速注册" style:UIBarButtonItemStylePlain target:self action:@selector(pushRegisViewController:)];
    
//    self.view.backgroundColor = [UIColor lineColor];
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, self.view.bounds.size.height)];
    table.dataSource = self;
    table.delegate = self;
    table.backgroundColor = [UIColor lineColor];

    [table registerClass:[LoginCell class] forCellReuseIdentifier:kCell];

    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 500)];
    footerView.backgroundColor = [UIColor lineColor];
    
    UIButton *login = [UIButton new];
    login.backgroundColor = [UIColor redColor];
    [login setTitle:@"立即登录" forState:UIControlStateNormal];
    login.titleLabel.textColor = [UIColor blackColor];
    login.titleLabel.textAlignment = NSTextAlignmentCenter;
    login.layer.cornerRadius = 2.0f;

    UIButton *forgetPassword = [UIButton new];
    [forgetPassword setTitle:@"忘记密码？" forState:UIControlStateNormal];
    forgetPassword.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    [forgetPassword setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    forgetPassword.titleLabel.textAlignment = NSTextAlignmentCenter;

    UIView *line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    UILabel *tips = [UILabel new];
    tips.text = @"或使用合作帐号登录";
    tips.opaque = YES;
    tips.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    tips.backgroundColor = [UIColor lineColor];
    tips.textAlignment = NSTextAlignmentCenter;
    
    UIButton *qqLogin = [UIButton new];
    [qqLogin setImage:[UIImage imageNamed:@"login_qq"] forState:UIControlStateNormal];
    UIButton *wechatLogin = [UIButton new];
    [wechatLogin setImage:[UIImage imageNamed:@"login_wc"] forState:UIControlStateNormal];

    UIButton *weiboLogin = [UIButton new];
    [weiboLogin setImage:[UIImage imageNamed:@"login_sina"] forState:UIControlStateNormal];

    
    
    
    
    [footerView addSubview:login];
    [footerView addSubview:forgetPassword];
    [footerView addSubview:line];
    [footerView addSubview:tips];
    [footerView addSubview:qqLogin];
    [footerView addSubview:wechatLogin];
    [footerView addSubview:weiboLogin];

    
    table.tableFooterView = footerView;

    [self.view addSubview:table];

    
//    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.equalTo(table.mas_left);
////        make.right.equalTo(table.mas_right);
////        make.height.equalTo(@200);
//        make.bottom.equalTo(self.view.mas_bottom);
//        
//    }];
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView.mas_centerX);
        make.top.equalTo(footerView.mas_top).offset(20);
        make.width.equalTo(@350);
        make.height.equalTo(@30);
    }];
    [forgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(login.mas_right);
        make.top.equalTo(login.mas_bottom).offset(5);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(footerView.mas_width);
        make.centerX.equalTo(footerView.mas_centerX);
        make.bottom.equalTo(footerView.mas_bottom).offset(-200);
        make.height.equalTo(@1);
    }];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView.mas_centerX);
        make.centerY.equalTo(line.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(@20);
    }];
    [qqLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView.mas_right).multipliedBy(1.0f/4);
        make.centerY.equalTo(footerView.mas_bottom).offset(-150);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    [wechatLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView.mas_right).multipliedBy(2.0f/4);
        make.centerY.equalTo(footerView.mas_bottom).offset(-150);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    [weiboLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView.mas_right).multipliedBy(3.0f/4);
        make.centerY.equalTo(footerView.mas_bottom).offset(-150);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.image.image = [UIImage imageNamed:@"login_user"];
        cell.textInput.placeholder = @"请输入11位手机号";
    } else {
        cell.image.image = [UIImage imageNamed:@"login_pw"];
        cell.textInput.placeholder = @"请输入密码";
    }

    return cell;
}

-(void)pushRegisViewController: (id)sender {
    NSLog(@"%d", __LINE__);
}

@end
