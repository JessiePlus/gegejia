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
    horizonalflowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _horizonalController = [[HorizonalCollectionViewController alloc] initWithCollectionViewLayout:horizonalflowLayout];
    
    UICollectionViewFlowLayout *titleflowLayout = [UICollectionViewFlowLayout new];
    titleflowLayout.itemSize = CGSizeMake(40, 20);
    titleflowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _titleController = [[titleCollectionViewController alloc] initWithCollectionViewLayout:titleflowLayout];
    
    homePageTableViewController *homePageController = [homePageTableViewController new];
    foodTableViewController *foodControllers = [foodTableViewController new];
    NSArray *titles = @[@"首页", @"休闲零食"];
    NSArray *controllers = @[homePageController, foodControllers];
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
    [self.view addSubview:_titleController.collectionView];
    [self.view addSubview:_horizonalController.collectionView];
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
