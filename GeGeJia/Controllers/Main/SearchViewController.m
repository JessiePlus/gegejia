//
//  SearchViewController.m
//  GeGeJia
//
//  Created by dinglin on 16/3/1.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "SearchViewController.h"
#import "Utils.h"

@interface SearchViewController () <UISearchBarDelegate, UIScrollViewDelegate>
@property (nonatomic) UISearchBar *searchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar = [UISearchBar new];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"请输入关键字";
    self.view.backgroundColor = [UIColor themeColor];
    self.navigationItem.titleView = _searchBar;


}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (_searchBar.text.length == 0) {
        return ;
    }
    [searchBar resignFirstResponder];
    NSLog(@"%@", searchBar.text);
}

@end
