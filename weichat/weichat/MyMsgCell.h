//
//  MyMsgCell.h
//  weichat
//
//  Created by LeiShan on 16/5/12.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"
#import "MsgMOdel.h"
@interface MyMsgCell : UITableViewCell
@property(nonatomic,strong)TalkModel *talkModel ;
@property(nonatomic,strong)MsgMOdel *msgModel ;
@end
