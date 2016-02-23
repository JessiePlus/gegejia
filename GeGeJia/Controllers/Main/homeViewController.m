//
//  mainViewController.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "homeViewController.h"
#import "HorizonalCollectionViewController.h"
#import "homePageTableViewController.h"
#import "foodTableViewController.h"
#import "titleCollectionViewController.h"
#import "tonicTableViewController.h"
#import "maternalAndChildTableViewController.h"
#import "finallySnappedTableViewController.h"
#import "rightAwayTableViewController.h"
#import <Masonry/Masonry.h>

@interface homeViewController () {
    HorizonalCollectionViewController *_horizonalController;
    titleCollectionViewController *_titleController;
}

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navItemSearch"] style:UIBarButtonItemStylePlain target:self action:@selector(pushSearchViewController)];
    
    UICollectionViewFlowLayout *horizonalflowLayout = [UICollectionViewFlowLayout new];
    horizonalflowLayout.itemSize = CGSizeMake(375, 400);
    horizonalflowLayout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 0);
    horizonalflowLayout.minimumInteritemSpacing = 0.0f;
    horizonalflowLayout.minimumLineSpacing      = 0.0f;
    horizonalflowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _horizonalController = [[HorizonalCollectionViewController alloc] initWithCollectionViewLayout:horizonalflowLayout];
    
    UICollectionViewFlowLayout *titleflowLayout = [UICollectionViewFlowLayout new];
    titleflowLayout.itemSize = CGSizeMake(80, 50);
    titleflowLayout.sectionInset            = UIEdgeInsetsMake(0, 0, 0, 0);
    titleflowLayout.minimumInteritemSpacing = 0.0f;
    titleflowLayout.minimumLineSpacing      = 0.0f;
    titleflowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _titleController = [[titleCollectionViewController alloc] initWithCollectionViewLayout:titleflowLayout];
    
    homePageTableViewController *homePageController = [homePageTableViewController new];
    foodTableViewController *foodController = [foodTableViewController new];
    tonicTableViewController *tonicController = [tonicTableViewController new];
    maternalAndChildTableViewController *maternalAndChildController = [maternalAndChildTableViewController new];
    finallySnappedTableViewController *finallySnappedController = [finallySnappedTableViewController new];
    rightAwayTableViewController *rightAwayController = [rightAwayTableViewController new];
    
    NSArray *titles = @[@"首页", @"休闲零食", @"保健滋补", @"母婴健康", @"最后疯抢", @"即将开抢"];
    NSArray *controllers = @[homePageController, foodController, tonicController, maternalAndChildController, finallySnappedController, rightAwayController];
    [_horizonalController controllers:controllers];
    [_titleController title:titles];
    
    __weak HorizonalCollectionViewController *weakHorizonalController = _horizonalController;
    __weak titleCollectionViewController *weakTitleController = _titleController;
    
    
    _titleController.changeIndex = ^(NSUInteger index) {
        [weakHorizonalController.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:index] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    };
    
    _horizonalController.changeIndex = ^(NSUInteger index) {
        [weakTitleController.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:index] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    };
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:_horizonalController.collectionView];
    [self.view addSubview:_titleController.collectionView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [_titleController.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        NSLog(@"%@", NSStringFromCGRect(self.view.bounds));
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(@375);
        make.height.equalTo(@50);
    }];

    [_horizonalController.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleController.collectionView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(@375);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}



#pragma mark - 处理左右navigationItem点击事件

- (void)pushSearchViewController
{
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
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
