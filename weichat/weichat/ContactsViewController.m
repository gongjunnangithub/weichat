//
//  ContactsViewController.m
//  weichat
//
//  Created by LeiShan on 16/5/3.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()
@property(nonatomic,strong)UITableView *contactsList ;
@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contacts_add_friend"] style:UIBarButtonItemStylePlain target:self action:@selector(addContacts)];
    self.navigationController.navigationItem.rightBarButtonItem = item ;
}
- (void)addContacts{



}
- (void)setTableView {
    self.contactsList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    


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
