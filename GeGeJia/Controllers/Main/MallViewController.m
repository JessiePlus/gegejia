//
//  mallViewController.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "MallViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>
#import "SDCycleScrollView.h"


@interface MallViewController ()

@end

@implementation MallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    
//    UIImageView *test = [UIImageView new];
//    [test sd_setImageWithURL:[NSURL URLWithString:@"http://tse2.mm.bing.net/th?id=OIP.Mc6bfaa79b619eb8176fc7210c1237961o0&w=241&h=154&c=7&rs=1&qlt=90&o=4&pid=1.1"]];
//    [self.view addSubview:test];
//    
//    
//    [test mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
//    [NSURL URLWithString:@"http://app.gegejia.com/yangege/appNative/resource/homeList"];
//    [NSURL URLWithString:@"http://app.gegejia.com/yangege/appNative/resource/homeDetail"];
    


//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager POST:URLString parameters:parameters constructingBodyWithBlock:nil progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"%d, %@", __LINE__, uploadProgress);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"请求成功---%@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"请求失败---%@", error);
//    }];

//
    
    
//    NSDictionary *parameters = @{@"os": @"1",
//                                 @"params": @{@"type":@"124569"},
//                                 @"remark": @"isVestUpdate35",
//                                 @"sign": @"4435912AAF47B2C3",
//                                 @"version": @"2.3"
//                                 };


    
    
/********************/
//    NSString *URLString = @"http://yangege.b0.upaiyun.com/activity/saleWindow/11e1886713d30.jpg!17newsell";

//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"image/jpeg"];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    [manager GET:URLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//                NSLog(@"%d, %@", __LINE__, downloadProgress);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        UIImage *image = [UIImage imageWithData:responseObject];
//        NSLog(@"请求成功---%@, %@", task, responseObject);
//        //        NSData *data = [NSData dataWithBytes:responseObject length:<#(NSUInteger)#>];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                NSLog(@"请求失败---%@", error);
//    }];
    /********************/

    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    //网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 320, 375, 180) imageURLStringsGroup:nil]; // 模拟网络延时情景
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = (id)self;
//    cycleScrollView2.titlesGroup = titles;
//    cycleScrollView2.dotColor = [UIColor yellowColor]; // 自定义分页控件小圆标颜色
    cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@"placeholder"];
    [self.view addSubview:cycleScrollView2];
    
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
