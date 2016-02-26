//
//  PageScrollViewController.m
//  GeGeJia
//
//  Created by dinglin on 16/2/25.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "PageScrollViewController.h"
#import <Masonry/masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

#define kTimeInterval 2.0f


@interface PageScrollViewController () <UIScrollViewDelegate> {
    UIPageControl *_pageControl;
    UIScrollView *_scrollView;
    NSTimer *_timer;
}
@property (assign, nonatomic, getter=isAutoPaging) BOOL autoPaging;

@end

@implementation PageScrollViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = 3;
    _pageControl.currentPage = 0;
    _pageControl.hidesForSinglePage = YES;
    
    
    _scrollView = [UIScrollView new];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentOffset = CGPointMake(375, 0);
    
    UIImageView *picture0 = [UIImageView new];
    [picture0 sd_setImageWithURL:[NSURL URLWithString:@"http://tse2.mm.bing.net/th?id=OIP.Mc6bfaa79b619eb8176fc7210c1237961o0&w=241&h=154&c=7&rs=1&qlt=90&o=4&pid=1.1"]];
    UIImageView *picture1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll1.png"]];
    UIImageView *picture2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll2.png"]];
    UIImageView *picture3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll3.png"]];
    UIImageView *picture4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll1.png"]];

    picture0.userInteractionEnabled = YES;
    picture1.userInteractionEnabled = YES;
    picture2.userInteractionEnabled = YES;
    picture3.userInteractionEnabled = YES;
    picture4.userInteractionEnabled = YES;
    
    
    picture0.frame = CGRectMake(0, 0, 375, 100);
    picture1.frame = CGRectMake(375, 0, 375, 100);
    picture2.frame = CGRectMake(375*2, 0, 375, 100);
    picture3.frame = CGRectMake(375*3, 0, 375, 100);
    picture4.frame = CGRectMake(375*4, 0, 375, 100);

    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375*3, 100)];
    [contentView addSubview:picture0];
    [contentView addSubview:picture1];
    [contentView addSubview:picture2];
    [contentView addSubview:picture3];
    [contentView addSubview:picture4];

    
    _scrollView.contentSize = CGSizeMake(375*5, 100);//contentView.bounds.size;
    [_scrollView addSubview:contentView];
    [self.view addSubview:_scrollView];
    [self.view addSubview:_pageControl];
    
    
    if (!self.isTimerRuning) {
        [self startAutoPaging];
    }
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.25f);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.25f);
        
        
    }];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *) scrollView {
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    if(currentOffsetX ==0.0f){
        [scrollView  setContentOffset:CGPointMake(375*3, 0) animated:NO];
        _pageControl.currentPage = 2;
    }else if(currentOffsetX == 375*4){
        [scrollView  setContentOffset:CGPointMake(375, 0) animated:NO];
        _pageControl.currentPage = 0;

    } else {
        _pageControl.currentPage = currentOffsetX/375 - 1;
    }
}

#pragma mark 轮切
/**
 * 以duration时间间隔，开启定时切换图片
 */
- (void)startAutoPagingWithDuration
{
    // 先停止正在执行的定时器
    [self stopTimer];
    
    self.autoPaging = YES;
    [self startTimer];
}

/**
 * 开启自动切换图片
 */
- (void)startAutoPaging
{
    // 先停止正在执行的定时器
    [self stopTimer];
    
    self.autoPaging = YES;
    [self startTimer];
}

/**
 * 停止自动切换图片
 */
- (void)stopAutoPaging
{
    self.autoPaging = NO;
    [self stopTimer];
}

/**
 * 开启定时器
 */
- (void)startTimer
{
    if (!_timer) {
        // 注册定时器
        _timer = [NSTimer timerWithTimeInterval:kTimeInterval target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

/**
 * 关闭定时器
 */
- (void)stopTimer
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (BOOL)isTimerRuning {
    return _timer.isValid;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.isAutoPaging) {
        [self stopTimer];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.isAutoPaging) {
        [self startTimer];
    }
}
//3个问题：1.currentOffsetX有时候不是375倍数，2.要把改变currentPage写进动画，3.不能下拉。
- (void)nextPage
{
    //NSLog(@"%d, %f", __LINE__, _scrollView.contentOffset.x);
    
    CGFloat currentOffsetX = _scrollView.contentOffset.x;
    if(currentOffsetX ==0.0f){
        _pageControl.currentPage = 2;
        [_scrollView  setContentOffset:CGPointMake(375*3, 0) animated:NO];
    }else if(currentOffsetX == 375*4){
        _pageControl.currentPage = 0;
        [_scrollView  setContentOffset:CGPointMake(375, 0) animated:NO];
        
    } else {
        _pageControl.currentPage = currentOffsetX/375 - 1;
        [_scrollView setContentOffset:CGPointMake(_pageControl.currentPage*375, 0) animated:YES];
        
    }
}

@end
