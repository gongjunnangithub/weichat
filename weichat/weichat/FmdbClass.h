//
//  FmdbClass.h
//  weichat
//
//  Created by LeiShan on 16/5/6.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "TalkModel.h"
@interface FmdbClass : NSObject
-(void)crateSqlite ;
- (void)insertMessages:(TalkModel *)models;
- (NSArray *)resultss ;
- (NSMutableArray *)resultWithName:(NSString *)name ;
@end
