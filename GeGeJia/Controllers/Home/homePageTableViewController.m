//
//  homePageTableViewController.m
//  GeGeJia
//
//  Created by dinglin on 16/2/22.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "homePageTableViewController.h"
#import <MJRefresh/MJRefresh.h>
#import "PageScrollViewController.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface homePageTableViewController () {
    
}
@property (nonatomic, strong) PageScrollViewController *pageScrollController;
@property (nonatomic, strong) UIImageView *leftImg, *rightImg;
@property (nonatomic, strong) UIImageView *shareImg;
@end

@implementation homePageTableViewController
static NSString * const homePageTableViewCellReuseIdentifier = @"homePageCell";
static NSString * const pageControlTableViewCellReuseIdentifier = @"pageControlCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:homePageTableViewCellReuseIdentifier];
    //[self.tableView registerClass:[pageControlTableViewCell class] forCellReuseIdentifier:pageControlTableViewCellReuseIdentifier];
    
    
    _pageScrollController = [PageScrollViewController new];
    
    _leftImg = [UIImageView new];
    _leftImg.contentMode = UIViewContentModeScaleToFill;
    [_leftImg sd_setImageWithURL:[ NSURL URLWithString:@"http://tse1.mm.bing.net/th?&id=OIP.M997ba31bb6fdfe35a86fcf4eec916937o0&w=300&h=200&c=0&pid=1.9&rs=0&p=0"]];
    _rightImg = [UIImageView new];
    _rightImg.contentMode = UIViewContentModeScaleToFill;
    [_rightImg sd_setImageWithURL:[ NSURL URLWithString:@"http://tse1.mm.bing.net/th?&id=OIP.Mb7b6a331f3031110a8bbf5b40662a582o0&w=300&h=200&c=0&pid=1.9&rs=0&p=0"]];

    
    
    
    __unsafe_unretained UITableView *tableView = self.tableView;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_header endRefreshing];
        });
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 结束刷新
            [tableView.mj_footer endRefreshing];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger n = 0;
    switch (section) {
        case 0:
            n = 1;
            break;
        case 1:
            n = 1;
            break;
        case 2:
            n = 3;
            break;
        default:
            n = 0;
            break;
    }
    return n;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger height = 40;
    switch (indexPath.section) {
        case 0:
            height = 100;
            break;
        case 1:
            height = 40;
            break;
        default:
            height = 40;
            break;
    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:homePageTableViewCellReuseIdentifier forIndexPath:indexPath];
        [cell.contentView addSubview:_pageScrollController.view];
        [_pageScrollController.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(cell.contentView);
            }];
    } else if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:homePageTableViewCellReuseIdentifier forIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor grayColor];
        [cell.contentView addSubview:_leftImg];
        [cell.contentView addSubview:_rightImg];
        
        [_leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(cell.contentView).multipliedBy(0.49);
            make.height.equalTo(cell.contentView);
            make.left.equalTo(cell.contentView.mas_left);
            make.top.equalTo(cell.contentView.mas_top);
        }];
        [_rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(cell.contentView).multipliedBy(0.49);
            make.height.equalTo(cell.contentView);
            make.right.equalTo(cell.contentView.mas_right);
            make.top.equalTo(cell.contentView.mas_top);
        }];
    }
    else if (indexPath.section == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:homePageTableViewCellReuseIdentifier forIndexPath:indexPath];
            switch (indexPath.row) {
                case 0:
                    cell.backgroundColor = [UIColor whiteColor];
                    break;
                case 1:
                    cell.backgroundColor = [UIColor blueColor];
                    break;
                case 2:
                    cell.backgroundColor = [UIColor redColor];
                    break;
                case 3:
                    cell.backgroundColor = [UIColor purpleColor];
                    break;
                default:
                    cell.backgroundColor = [UIColor purpleColor];
                    break;
            }
    }

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
