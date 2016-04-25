//
//  BaseTabBarController.m
//  weichat
//
//  Created by LeiShan on 16/4/21.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
@interface BaseTabBarController ()
- (void)setTabs ;
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabs] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTabs {
    [self addVCWithVC:[HomeViewController new] tabBarTitle:@"微信" PictureName:@"tabbar_mainframeHL" AndNavTitle:@"微信"];
    [self addVCWithVC:[HomeViewController new] tabBarTitle:@"微信" PictureName:@"tabbar_mainframeHL" AndNavTitle:@"微信"];
    [self addVCWithVC:[HomeViewController new] tabBarTitle:@"微信" PictureName:@"tabbar_mainframeHL" AndNavTitle:@"微信"];
    [self addVCWithVC:[HomeViewController new] tabBarTitle:@"微信" PictureName:@"tabbar_mainframeHL" AndNavTitle:@"微信"];


}
- (void)addVCWithVC:(UIViewController *)vc tabBarTitle:(NSString *)title PictureName:(NSString *)pictureNam AndNavTitle:(NSString *)navTitle{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc] ;
    nav.title = navTitle ;
    [self addChildViewController:nav] ;
    nav.tabBarItem.title = title ;
//    nav.tabBarItem.selectedImage = [UIImage imageNamed:pictureNam] ;
    nav.tabBarItem.image = [UIImage imageNamed:pictureNam] ;
    nav.tabBarController.tabBar.tintColor = [UIColor greenColor] ;
}
@end
