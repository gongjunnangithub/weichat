//
//  HomeViewController.m
//  weichat
//
//  Created by LeiShan on 16/4/21.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "HomeViewController.h"
#import "ContactAddView.h"
#import "Define.h"
#import "HomeCellTableViewCell.h"
#import "FmdbClass.h"
#define Kmargin 5
@interface HomeViewController ()
@property(nonatomic,strong)UITableView *tableView ;
@property(nonatomic,strong)UISearchBar *searchBar ;
@property(nonatomic,strong)NSArray *dataArray ;
@property(nonatomic,strong)NSArray  *contactArray ;
@property(nonatomic,strong)ContactAddView *contactView ;
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
    UITapGestureRecognizer *guester = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapAction)] ;
    [self.view addGestureRecognizer:guester] ;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"barbuttonicon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(addAction)];
    self.navigationItem.rightBarButtonItem = item ;
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
// Lastdate  name imageName  lastContent 
#pragma mark - +方法
- (void)addAction {
    if (self.contactView.hidden) {
        self.contactView.hidden = !self.contactView.hidden ;
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.contactView.alpha = 0 ;
            self.contactView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        } completion:^(BOOL finished) {
            self.contactView.hidden = YES ;
            self.contactView.alpha =1 ;
            self.contactView.transform = CGAffineTransformIdentity ;
        }] ;
    }
}
#pragma mark - 点击 隐藏加号菜单
- (void)viewTapAction {
    if (!self.contactView.hidden) {
        [self addAction] ;
    }
    
}

- (NSArray *)contactArray {
    if (_contactArray == nil) {
        _contactArray = [[NSArray alloc] init] ;
        _contactArray = @[@{@"imageName":@"contacts_add_newmessage",@"title":@"发起群聊"},@{@"imageName":@"contacts_add_friend",@"title":@"添加朋友"},@{@"imageName":@"contacts_add_scan",@"title":@"扫一扫"},@{@"imageName":@"contacts_add_newmessage",@"title":@"收付款"}];
    }
    return _contactArray ;
}
- (ContactAddView *)contactView {
    if (_contactView == nil) {
        _contactView = [[ContactAddView alloc] init] ;
        _contactView.layer.anchorPoint = CGPointMake(0.8, 0) ;
        [self.view addSubview:_contactView] ;
        [_contactView contactViewWithBtnArray:self.contactArray AndActionBlock:^(int i) {
            switch (i) {
                case 1:
                    
                    break;
                    
                default:
                    break;
            }
        }] ;
        _contactView.hidden = YES ;
    }
    return _contactView ;

}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSArray alloc] init] ;
        FmdbClass *db = [[FmdbClass alloc] init] ;
        _dataArray = [db resultss] ;
    }
    return _dataArray ;
}
#pragma mark - tableviewDelegate dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString *homeCell = @"homeCell";
    HomeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCell];
    if (cell == nil) {
        cell = [[HomeCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:homeCell] ;
    }
    TalkModel *model = self.dataArray[indexPath.row] ;
    cell.talkMidel = model ;
    return cell ;
}

@end
