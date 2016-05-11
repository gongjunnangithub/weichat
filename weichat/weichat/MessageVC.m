//
//  MessageVC.m
//  weichat
//
//  Created by LeiShan on 16/5/10.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "MessageVC.h"
#import "FmdbClass.h"
@interface MessageVC ()
@property(nonatomic,strong)NSMutableArray *msgContent ;
@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.msgContent) ;
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
- (NSMutableArray *)msgContent {
    if (_msgContent == nil) {
        _msgContent = [NSMutableArray array] ;
        _msgContent = [[[FmdbClass alloc] init] resultWithName:self.personModel.name] ;
    }

    return _msgContent ;
}
@end
