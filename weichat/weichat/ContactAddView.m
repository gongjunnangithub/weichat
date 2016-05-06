//
//  ContactAddView.m
//  weichat
//
//  Created by LeiShan on 16/5/6.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "ContactAddView.h"
#import "Define.h"
@interface ContactAddView()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *listTableView ;
@property(nonatomic,strong)NSArray *btnArray ;
 @end
@implementation ContactAddView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)contactViewWithBtnArray:(NSArray *)btns AndActionBlock:(void (^)(int))BtnClick
{
    self.btnClick = BtnClick ;
    self.btnArray = btns ;
    self.frame = CGRectMake(KScreenWidth - 154, 5, 150, btns.count *60);
    self.listTableView = [[UITableView alloc] initWithFrame:self.bounds] ;
    [self addSubview:self.listTableView];
    self.backgroundColor = [UIColor blackColor];
    self.listTableView.backgroundColor = [UIColor blackColor];
    self.listTableView.delegate = self ;
    self.listTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine ;
    self.listTableView.dataSource = self ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.btnArray.count ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60 ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"contactCell" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId] ;
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.contentView.backgroundColor = [UIColor blackColor] ;
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    cell.imageView.image = [UIImage imageNamed:self.btnArray[indexPath.row][@"imageName"]];
    cell.textLabel.text = self.btnArray[indexPath.row][@"title"] ;
    
    return cell ;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath] ;
    cell.selected = NO ;
    if (self.btnClick) {
        self.btnClick((int)indexPath.row) ;
    }
}
@end
