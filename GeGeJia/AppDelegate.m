//
//  AppDelegate.m
//  gegejia
//
//  Created by dinglin on 16/2/21.
//  Copyright © 2016年 dinglin. All rights reserved.
//

#import "AppDelegate.h"
#import "homeViewController.h"
#import "mallViewController.h"
#import "cartViewController.h"
#import "userViewController.h"
#import "tabBarViewController.h"
#import "Utils.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [[UITabBar appearance] setTintColor:[UIColor titleColor]];
    // 延迟0.5s
    usleep(500 * 1000);
    
    homeViewController *homeController = [homeViewController new];
    UINavigationController *homeNavController = [[UINavigationController alloc] initWithRootViewController:homeController];
    homeController.tabBarItem.title = LocalizedString(@"home");
    
    UIImage *homeTabImg = [UIImage imageNamed:@"home_normal"];
    UIImage *homeTabSelectedImg = [UIImage imageNamed:@"home_selected"];
    homeController.tabBarItem.image = homeTabImg;
    homeController.tabBarItem.selectedImage = homeTabSelectedImg;
    
    
    mallViewController *mallController = [mallViewController new];
    UINavigationController *mallNavController = [[UINavigationController alloc] initWithRootViewController:mallController];
    mallController.tabBarItem.title = LocalizedString(@"mall");
    UIImage *mallTabImg = [UIImage imageNamed:@"mall_normal"];
    UIImage *mallTabSelectedImg = [UIImage imageNamed:@"mall_selected"];
    mallController.tabBarItem.image = mallTabImg;
    mallController.tabBarItem.selectedImage = mallTabSelectedImg;
    
    cartViewController *cartController = [cartViewController new];
    UINavigationController *cartNavController = [[UINavigationController alloc] initWithRootViewController:cartController];
    cartController.tabBarItem.title = LocalizedString(@"cart");
    UIImage *cartTabImg = [UIImage imageNamed:@"cart_normal"];
    UIImage *cartTabSelectedImg = [UIImage imageNamed:@"cart_selected"];
    cartController.tabBarItem.image = cartTabImg;
    cartController.tabBarItem.selectedImage = cartTabSelectedImg;
    
    
    userViewController *userController = [userViewController new];
    UINavigationController *userNavController = [[UINavigationController alloc] initWithRootViewController:userController];
    userController.tabBarItem.title = LocalizedString(@"user");
    UIImage *userTabImg = [UIImage imageNamed:@"user_normal"];
    UIImage *userTabSelectedImg = [UIImage imageNamed:@"user_selected"];
    userController.tabBarItem.image = userTabImg;
    userController.tabBarItem.selectedImage = userTabSelectedImg;
    
    tabBarViewController *tabBarController = [tabBarViewController new];
    tabBarController.viewControllers = @[homeNavController, mallNavController, cartNavController, userNavController];
    
    [self.window setRootViewController:tabBarController];
    self.window.backgroundColor = [UIColor yellowColor];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
