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
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"快速注册" style:UIBarButtonItemStylePlain target:self action:@selector(pushRegisViewController)];
    
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    table.dataSource = self;
    table.delegate = self;
    
    [table registerClass:[LoginCell class] forCellReuseIdentifier:kCell];

    
    UIView *footerView = [UIView new];
    footerView.backgroundColor = [UIColor greenColor];
    
    UIButton *login = [UIButton new];
    login.backgroundColor = [UIColor redColor];
    login.titleLabel.text = @"登录";
    login.titleLabel.textAlignment = NSTextAlignmentCenter;

    UIButton *forgetPassword = [UIButton new];
    forgetPassword.titleLabel.text = @"忘记密码";

    UIView *line = [UIView new];
    UILabel *tips = [UILabel new];
    UIButton *qqLogin = [UIButton new];
    UIButton *wechatLogin = [UIButton new];
    UIButton *weiboLogin = [UIButton new];
    
    
    
    
    [footerView addSubview:login];
    [footerView addSubview:forgetPassword];
    
    table.tableFooterView = footerView;

    [self.view addSubview:table];

    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(table.mas_left);
        make.right.equalTo(table.mas_right);

        make.bottom.equalTo(table.mas_bottom);
        
    }];
    

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    } else
        return 80;
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

@end
