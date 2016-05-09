//
//  FmdbClass.m
//  weichat
//
//  Created by LeiShan on 16/5/6.
//  Copyright © 2016年 GongJunNan. All rights reserved.
//
#define KSqlite @"myswlite.sqlite"
#define TableName @"Message"
#import "FmdbClass.h"
#import <FMDB.h>
@implementation FmdbClass
- (NSString *)getDocumentsPath {
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
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
        NSString *sqliteCreateTable = [NSString stringWithFormat:@"create table if not exists %@(id integer primary key autoincrement,name text ,lastDate text,contenttext,imageName text,content text)",TableName];
        BOOL result = [dateBase executeUpdate:sqliteCreateTable];
        NSLog(@"%D",result);
        
    }

}
- (void)insertMessages:(TalkModel *)models {
    FMDatabase *db = [FMDatabase databaseWithPath:[self getDocumentsPath]] ;
    if ([db open]) {
        if (models == nil) {
            NSMutableArray *array = [NSMutableArray array] ;
            for (int i = 0 ; i < 10; i++) {
                TalkModel *model = [[TalkModel alloc] init] ;
                model.imageName = [NSString stringWithFormat:@"%d.jpg",i];
                model.name = [NSString stringWithFormat:@"%d-%d-name",i,i] ;
                model.lastDate = [self getRandomDate] ;
                model.content = [NSString stringWithFormat:@"%d-%d-content",i,i];
                [array addObject:model];
            }
            for (TalkModel *model in array) {
                NSString *insetString = [NSString stringWithFormat:@"insert into %@ (imageName,name,lastDate) values('%@','%@','%@')",TableName,model.imageName,model.name,model.lastDate];
                BOOL insert = [db executeUpdate:insetString];
                NSLog(@"%D",insert) ;
   
            }
        }
    }
    


}
- (NSArray *)resultss{
    FMDatabase *fb = [FMDatabase databaseWithPath:[self getDocumentsPath]] ;
    if ([fb open]) {
        NSString *sqliteString = [NSString stringWithFormat:@"select * from %@",TableName];
        FMResultSet *set = [fb executeQuery:sqliteString] ;
        NSMutableArray *array = [NSMutableArray array] ;
        while ([set next]) {
            TalkModel *model = [[TalkModel alloc] init] ;
            model.name = [set stringForColumn:@"name"] ;
            model.imageName = [set stringForColumn:@"imageName"] ;
            model.lastDate = [set stringForColumn:@"lastDate"];
            model.content = [set stringForColumn:@"content"];
            [array addObject:model] ;
        }
        return array ;
    }
    return nil ;

}
- (NSString *)getRandomDate {
    int i = arc4random_uniform(2000);
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:i] ;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString ;
}
@end
