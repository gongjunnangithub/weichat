//
//  ContactsViewController.m
//  weichat
//
//  Created by LeiShan on 16/5/3.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "ContactsViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "AppUnit.h"
@interface ContactsViewController ()
@property(nonatomic,strong)UITableView *contactsList ;
@property(nonatomic,strong)NSMutableArray *contactsArray ;
@property(nonatomic,strong)UISearchBar *searchBar ;
@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"contacts_add_friend"] style:UIBarButtonItemStylePlain target:self action:@selector(addContacts)];
    self.navigationController.navigationItem.rightBarButtonItem = item ;
    [self setTableView];
    [self setSearchBar];
    KLog(self.contactsArray);
}
- (void)addContacts{



}
- (void)setTableView {
    self.contactsList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.contactsList.frame = CGRectMake(0, 0,KScreenWidth ,KScreenHight  - KBottomBarHeight);
    self.contactsList.delegate = self ;
    self.contactsList.dataSource = self ;
    [self.view addSubview:self.contactsList];

}
- (void)setSearchBar {
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0 , 0, KScreenWidth, 45)] ;
    self.searchBar.placeholder = @"搜索" ;
    self.contactsList.tableHeaderView = self.searchBar ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *)contactsArray {
    if (_contactsArray == nil) {
        _contactsArray = [NSMutableArray array];
         NSMutableArray * contactsArray = [NSMutableArray array];
        CNContactStore *store = [[CNContactStore alloc] init];
        CNAuthorizationStatus statuds = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        if (statuds == CNAuthorizationStatusNotDetermined) {
            [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (!granted) {
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请先打开设置，允许访问通讯录" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        nil;
                    }];
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        nil ;
                    }];
                    [alert addAction:cancleAction];
                    [alert addAction:okAction];
                    [self presentViewController:alert animated:YES completion:nil];
                }
            } ];
        }
        NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
        CNContactFetchRequest *reault = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
        [store enumerateContactsWithFetchRequest:reault error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
//            KLog(contact.namePrefix);
            [contactsArray addObject:contact];
            
        }];
        
//        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"familyName" ascending:YES];
//        [_contactsArray sortedArrayUsingDescriptors:@[descriptor]];
        while (contactsArray.count) {
            NSString *letter = [[contactsArray[0] familyName] substringWithRange:NSMakeRange(0, 1)] ;
            NSMutableArray *array = [NSMutableArray array];
            for (int i = 0; i < contactsArray.count; i++) {
                if ( letter == [[contactsArray[0] familyName] substringWithRange:NSMakeRange(0, 1)]) {
                    [array addObject:contactsArray[0]];
                    --i;
                    [contactsArray removeObjectAtIndex:0];
                };
            }
                 NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:array,@"content",letter,@"title", nil];
                [_contactsArray addObject:dict];
            
            }
        
    }

    return _contactsArray ;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dict = self.contactsArray[section];
    NSString *title = dict[@"title"];
    return title ;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contactsArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = self.contactsArray[section];
    NSArray *array = dict[@"content"];
    return array.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    NSDictionary *dict = self.contactsArray[indexPath.section];
    NSArray *array = dict[@"content"];
    CNContact *contace = array[indexPath.row];
    cell.textLabel.text = contace.familyName ;
    int number = arc4random_uniform(10);
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",number]];
    
    cell.imageView.image = [AppUnit OriginImage:image scaleToSize:CGSizeMake(35, 35)];
    return cell ;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"{search}"];
    for (NSDictionary *dic in self.contactsArray) {
        [array addObject:dic[@"title"]];
    }
    return array ;
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
