//
//  TalkModel.h
//  weichat
//
//  Created by LeiShan on 16/5/9.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TalkModel : NSObject
/*
 name text ,date text,who integer,contenttext,imageName text
 */
@property(nonatomic,copy)NSString *name ;
@property(nonatomic,copy)NSString *lastDate ;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *imageName ;
@end
