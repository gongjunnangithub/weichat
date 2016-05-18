//
//  DiscoverViewController.m
//  weichat
//
//  Created by LeiShan on 16/5/3.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)UITableView *disTableView ;
@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTableView];
    self.view.backgroundColor = [UIColor lightGrayColor];
}
- (void)setTableView {
    self.disTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHight-KBottomBarHeight) style:UITableViewStylePlain];
    [self.view addSubview:self.disTableView];
    self.disTableView.delegate = self ;
    self.disTableView.dataSource = self ;

}
-(NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSArray array] ;
        _dataArray = @[@[@{@"title":@"朋友圈",@"image":@"ff_IconShowAlbum"}],@[@{@"title":@"扫一扫",@"image":@"ff_IconQRCode"},@{@"title":@"摇一摇",@"image":@"ff_IconShake"}],@[@{@"title":@"附近的人",@"image":@"ff_IconLocationService"},@{@"title":@"漂流瓶",@"image":@"ff_IconBottle"}],@[@{@"title":@"购物",@"image":@"ff_IconShake"},@{@"title":@"游戏",@"image":@"MoreGame"}]];
    }
    
    return _dataArray ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10 ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15 ;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count] ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"disCell"];
    NSDictionary *dict = self.dataArray[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed: dict[@"image"]];
    cell.textLabel.text = dict[@"title"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
    return cell ;
}
@end
