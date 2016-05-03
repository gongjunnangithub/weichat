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
@property(nonatomic,strong)NSArray *dataArray ;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,KScreenWidth ,KScreenHight - KTopHeight - KBottomBarHeight) style:UITableViewStylePlain];
    self.tableView.dataSource = self ;
    self.tableView.delegate = self ;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine ;
    [self.view addSubview:self.tableView] ;
    if (SystenVersion >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone ;
    }
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

#pragma mark - tableviewDelegate dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [[UITableViewCell alloc] init] ;
}
@end
