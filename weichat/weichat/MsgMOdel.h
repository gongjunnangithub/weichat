//
//  MsgMOdel.h
//  weichat
//
//  Created by LeiShan on 16/5/10.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MsgMOdel : NSObject
@property(nonatomic,strong)NSString *contentDate ;
@property(nonatomic,strong)NSString *content ;
@property(nonatomic,assign)NSInteger sendPerson ;
@end
