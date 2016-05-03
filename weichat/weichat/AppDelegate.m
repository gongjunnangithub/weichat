//
//  AppDelegate.m
//  weichat
//
//  Created by LeiShan on 16/4/21.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "AppDelegate.h"
#import "Define.h"
#import "BaseTabBarController.h"
#import "HomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:KScreenBounds] ;
    BaseTabBarController *baseTabBarVC = [[BaseTabBarController alloc] init] ;
    self.window.rootViewController = baseTabBarVC;//[[HomeViewController alloc] init] ;
    [self setNavigationBar] ;
    [self.window makeKeyAndVisible] ;
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
- (void)setNavigationBar {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent ;
    UINavigationBar *bar = [UINavigationBar appearance] ;
    CGFloat rgb = 0.1 ;
    bar.barTintColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:0.9];
    [bar setBarTintColor:[UIColor colorWithRed:rgb green:rgb blue:rgb alpha:0.9]];
    bar.tintColor = [UIColor whiteColor] ;
    [bar setTintColor:[UIColor whiteColor]];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:20]};
}
@end
