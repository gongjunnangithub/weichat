//
//  BaseTabBarController.m
//  weichat
//
//  Created by LeiShan on 16/4/21.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "Define.h"
#import "ContactsViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "BaseNavigationVC.h"
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
    [self addVCWithVC:[HomeViewController new] tabBarTitle:@"微信" PictureName:@"tabbar_mainframe" AndNavTitle:@"微信"];
    [self addVCWithVC:[ContactsViewController new] tabBarTitle:@"通讯录" PictureName:@"tabbar_contacts" AndNavTitle:@"通讯录"];
    [self addVCWithVC:[DiscoverViewController new] tabBarTitle:@"发现" PictureName:@"tabbar_discover" AndNavTitle:@"发现"];
    [self addVCWithVC:[MineViewController new] tabBarTitle:@"我" PictureName:@"tabbar_me" AndNavTitle:@"我"];


}
- (void)addVCWithVC:(UIViewController *)vc tabBarTitle:(NSString *)title PictureName:(NSString *)pictureNam AndNavTitle:(NSString *)navTitle{
    UINavigationController *nav = [[BaseNavigationVC alloc] initWithRootViewController:vc] ;
    nav.navigationBar.topItem.title = navTitle ;
    UITabBarItem *item = nav.tabBarItem ;
    item.title = title ;
    NSString *selectedImageName = [NSString stringWithFormat:@"%@HL",pictureNam];
    item.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    item.image = [UIImage imageNamed:pictureNam] ;
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName :TabBarTitleColor} forState:UIControlStateSelected] ;
    [self addChildViewController:nav] ;

}
@end
