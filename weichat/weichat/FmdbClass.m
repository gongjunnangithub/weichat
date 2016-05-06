//
//  FmdbClass.m
//  weichat
//
//  Created by LeiShan on 16/5/6.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//
#define KSqlite @"myswlite.sqlite"
#import "FmdbClass.h"
#import <FMDB.h>
@implementation FmdbClass
- (NSString *)getDocumentsPath {
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDemoApplicationDirectory, NSUserDomainMask, YES);
    NSString *document = [documents objectAtIndex:0];
    NSString *path = [document  stringByAppendingPathComponent:KSqlite] ;
    return path ;
}
- (void)openFmdb {
    FMDatabase *dateBase = [FMDatabase databaseWithPath:[self getDocumentsPath]] ;
    [dateBase open] ;

}
// 按 最近日期 排序 内容 按日期排序
-(void)crateSqlite {
    FMDatabase *dateBase = [FMDatabase databaseWithPath:[self getDocumentsPath]] ;
    if ([dateBase open]) {
        NSString *sqliteCreateTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXITS "];
    }

}
@end
