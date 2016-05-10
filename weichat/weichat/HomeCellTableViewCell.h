//
//  HomeCellTableViewCell.h
//  weichat
//
//  Created by LeiShan on 16/4/22.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkModel.h"
@interface HomeCellTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *dateLabel ;
@property(nonatomic,strong)TalkModel *talkMidel ;
@end
