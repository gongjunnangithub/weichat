//
//  MessageVC.m
//  weichat
//
//  Created by LeiShan on 16/5/10.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import "MessageVC.h"
#import "FmdbClass.h"
#import "MyMsgCell.h"
#import "OthersCell.h"
@interface MessageVC ()<UITextFieldDelegate>
@property(nonatomic,strong)NSMutableArray *msgContent ;
@property(nonatomic,strong)UITableView *contentTableView ;
@property(nonatomic,strong)UIView *bottomView ;
@property(nonatomic,strong)UIButton *voiceBtn ;
@property(nonatomic,strong)UITextField *inputLable ;
@property(nonatomic,strong)UIButton *emogeBtn ;
@property(nonatomic,strong)UIButton *addBtn ;
@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHight-KBottomBarHeight) style:UITableViewStylePlain] ;
    self.contentTableView.delegate = self ;
    self.contentTableView.dataSource = self ;
    self.contentTableView.estimatedRowHeight = 100 ;
    self.contentTableView.rowHeight = UITableViewAutomaticDimension ;
    self.contentTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.contentTableView];
    [self setBOttmViewUI];
}

- (void)setBOttmViewUI {
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHight -KBottomBarHeight, KScreenWidth, KBottomBarHeight)];
    [self.view addSubview:self.bottomView];
    self.bottomView.backgroundColor = [UIColor lightGrayColor];
    self.voiceBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KBottomBarHeight, KBottomBarHeight)] ;
    [self.voiceBtn setBackgroundImage:[UIImage imageNamed:@"SenderVoiceNodePlaying003"] forState:UIControlStateNormal];
    [self.bottomView addSubview:self.voiceBtn];
    [self.voiceBtn addTarget:self action:@selector(voiceBtnClick:) forControlEvents:UIControlEventTouchUpInside] ;
    
    self.inputLable = [[UITextField alloc] initWithFrame:CGRectMake(KBottomBarHeight,(KBottomBarHeight - 40)*0.5, KScreenWidth - 130, 40)];
    self.inputLable.backgroundColor = [UIColor darkGrayColor];
    [self.bottomView addSubview:self.inputLable];
    self.inputLable.keyboardType = UIKeyboardTypeNamePhonePad ;
    
    self.emogeBtn = [[UIButton alloc] initWithFrame:CGRectMake(KScreenWidth- 80, 0, KBottomBarHeight, KBottomBarHeight)] ;
    [self.emogeBtn setBackgroundImage:[UIImage imageNamed:@"SenderVoiceNodePlaying003"] forState:UIControlStateNormal];
    [self.bottomView addSubview:self.emogeBtn];
    [self.emogeBtn addTarget:self action:@selector(voiceBtnClick:) forControlEvents:UIControlEventTouchUpInside] ;
    self.addBtn = [[UIButton alloc] initWithFrame:CGRectMake( KScreenWidth-40,0, KBottomBarHeight, KBottomBarHeight)] ;
    [self.addBtn setBackgroundImage:[UIImage imageNamed:@"barbuttonicon_add"] forState:UIControlStateNormal];
    [self.bottomView addSubview:self.addBtn];
    [self.addBtn addTarget:self action:@selector(voiceBtnClick:) forControlEvents:UIControlEventTouchUpInside] ;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillAppera:) name:UIKeyboardWillChangeFrameNotification object:nil];

}
- (void)keyBoardWillAppera:(NSNotification *)notification {
    NSLog(@"%@",notification);
    NSDictionary *dict = notification.userInfo ;
    CGRect beginREct = [[dict objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    if (beginREct.origin.y == KScreenHight) {
        [self setChangeFrameUp:YES withHeight:beginREct.size.height];
    } else {
        [self setChangeFrameUp:NO withHeight:beginREct.size.height];
    }
}
- (void)setChangeFrameUp:(BOOL)up withHeight:(CGFloat)height{
    CGRect rect = self.bottomView.frame ;
    if (up) {
        rect.origin.y -= height  ;
        
    } else {
        rect.origin.y += height  ;
    }
#pragma mark --TO do 
    NSIndexPath *index = [NSIndexPath indexPathForRow:self.msgContent.count inSection:1];
    UITableViewCell *cell = [self.contentTableView cellForRowAtIndexPath:index];
    CGFloat y = CGRectGetMidY(cell.frame);
    CGRect tableRect = self.contentTableView.frame ;
    if (tableRect.origin.y<0) {
        tableRect.origin.y = 0 ;
    } else if ((int)y/KScreenHight) {
        tableRect.origin.y =  -height ;
    } else if(y > KScreenHight - height){
        tableRect.origin.y = -tableRect.origin.y + (tableRect.origin.y - KScreenHight + height);
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomView.frame = rect;
        self.contentTableView.frame = tableRect ;
               }
    ];

}
- (void)voiceBtnClick:(UIButton*)btn {


}
- (NSMutableArray *)msgContent {
    if (_msgContent == nil) {
        _msgContent = [NSMutableArray array] ;
        _msgContent = [[[FmdbClass alloc] init] resultWithName:self.personModel.name] ;
    }

    return _msgContent ;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.msgContent.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MsgMOdel *model = self.msgContent[indexPath.row];
    if (model.sendPerson) {
        
    
    MyMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mymsgcell"];
    if (cell == nil) {
        cell = [[MyMsgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mymsgcell"];
    }
        cell.msgModel = model ;
        return cell ;
    } else {
    OthersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mymsgcell"];
    if (cell == nil) {
        cell = [[OthersCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mymsgcell"];
        
    }
    cell.msgModel = self.msgContent[indexPath.row] ;
    cell.talkModel = self.personModel;
    return cell ;
    }
}

@end
