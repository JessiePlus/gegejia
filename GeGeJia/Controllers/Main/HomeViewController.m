//
//  mainViewController.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//


#import "HomeViewController.h"
#import "HomePageViewController.h"
#import "FoodTableViewController.h"
#import "TonicTableViewController.h"
#import "MaternalAndChildTableViewController.h"
#import "FinallySnappedTableViewController.h"
#import "RightNowTableViewController.h"
#import <Masonry/Masonry.h>
#import "Utils.h"
#import "CAPSPageMenu.h"
#import "SearchViewController.h"

@interface HomeViewController () {
}
@property (nonatomic) CAPSPageMenu *pageMenu;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    self.navigationItem.title = @"首页";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navItemSearch"] style:UIBarButtonItemStylePlain target:self action:@selector(pushSearchViewController)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_logo"]];

    
    
    HomePageViewController *homePageController = [HomePageViewController new];
    homePageController.title = @"首页";
    
    FoodTableViewController *foodController = [FoodTableViewController new];
    foodController.title = @"休闲零食";

    TonicTableViewController *tonicController = [TonicTableViewController new];
    tonicController.title = @"保健滋补";

    MaternalAndChildTableViewController *maternalAndChildController = [MaternalAndChildTableViewController new];
    maternalAndChildController.title = @"母婴健康";

    FinallySnappedTableViewController *finallySnappedController = [FinallySnappedTableViewController new];
    finallySnappedController.title = @"最后疯抢";

    RightNowTableViewController *rightAwayController = [RightNowTableViewController new];
    rightAwayController.title = @"即将开抢";

    NSArray *controllers = @[homePageController, foodController, tonicController, maternalAndChildController, finallySnappedController, rightAwayController];
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor themeColor],
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor titleColor],
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor: [UIColor titleColor],
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor: [UIColor blackColor],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:70.0/255.0 green:70.0/255.0 blue:70.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES),
                                 CAPSPageMenuOptionEnableHorizontalBounce: @(NO),
                                 CAPSPageMenuOptionAddBottomMenuHairline:@(NO)
                                 };
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllers frame:CGRectMake(0.0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 40) options:parameters];
    
    [self.view addSubview:_pageMenu.view];

    self.view.backgroundColor = [UIColor themeColor];
}

#pragma mark - 处理左右navigationItem点击事件

- (void)pushSearchViewController
{
    [self.navigationController pushViewController:[SearchViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
