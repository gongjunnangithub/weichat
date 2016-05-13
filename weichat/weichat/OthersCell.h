//
//  OthersCell.h
//  weichat
//
//  Created by LeiShan on 16/5/13.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MsgMOdel.h"
#import "TalkModel.h"
@interface OthersCell : UITableViewCell
@property(nonatomic,strong)MsgMOdel *msgModel ;
@property(nonatomic,strong)TalkModel *talkModel ;
@end
