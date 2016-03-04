//
//  carViewController.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "CartViewController.h"
#import "FLAnimatedImage.h"
#import "masonry.h"
#import "Utils.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"购物车";
    self.view.backgroundColor = [UIColor themeColor];
//    UIWebView *webView = [UIWebView new];
    NSData *gif = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"empty_shoppingCart@2x" ofType:@"gif"]];
//    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
//    [self.view addSubview:webView];
//    
//    webView.frame = self.view.bounds;
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:gif];
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] init];
    imageView.animatedImage = image;
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"去逛逛" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor titleColor] forState:UIControlStateNormal];
    btn.layer.borderWidth  = 1.0f;
    btn.layer.borderColor  = [UIColor titleColor].CGColor;
    btn.layer.cornerRadius = 2.0f;
    [self.view addSubview:btn];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.width.equalTo(@200);
        make.height.equalTo(@200);
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        make.centerX.equalTo(imageView.mas_centerX);
    }];
    
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
