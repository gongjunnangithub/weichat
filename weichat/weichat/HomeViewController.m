//
//  HomeViewController.m
//  weichat
//
//  Created by LeiShan on 16/4/21.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "HomeViewController.h"
#import "Define.h"
#define Kmargin 5
@interface HomeViewController ()
@property(nonatomic,strong)UITableView *tableView ;
@property(nonatomic,strong)UISearchBar *searchBar ;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KTopHeight,KScreenWidth ,KScreenHight - KTopHeight - KBottomBarHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView] ;
    [self setSearchBar];
}
- (void)setSearchBar {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0 , 0, KScreenWidth, 45)] ;
    self.searchBar.placeholder = @"搜索" ;
    self.tableView.tableHeaderView = self.searchBar ;
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
