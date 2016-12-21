//
//  MessageClass.m
//  ShaoDianBao
//
//  Created by 光小星 on 2016/11/11.
//  Copyright © 2016年 xin yang. All rights reserved.
//
#define DBNAME                 @"shaodianbao.sqlite"
#define TABLENAME              @"message"

#import "MessageClass.h"
#import <sqlite3.h>
#import "MessageModel.h"

@interface MessageClass ()
{
    sqlite3 *db;
}
@end

@implementation MessageClass

-(id) init {
    if (self = [super init]) {
        [self OpenDataBase];
        [self createTable];
    }
    return self;
}

#pragma mark------------创建一个独立的执行sql语句的方法
-(void)execSql:(NSString *)sql
{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        sqlite3_close(db);
//        NSLog(@"数据库操作数据失败!");
    }
}


#pragma mark-----------打开数据库
-(void)OpenDataBase
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DBNAME];
    
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
//        NSLog(@"数据库打开失败");
    }
}

#pragma mark----------创建数据表PERSONINFO的语句
-(void)createTable
{
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS message (ID INTEGER PRIMARY KEY AUTOINCREMENT, message TEXT,time TEXT,type TEXT ,order_id TEXT ,title TEXT)";
    [self execSql:sqlCreateTable];
}

-(void)insertDataWithMessage:(NSString *)message WithType:(NSString *)type WithID:(NSString *)orderId WithTitle:(NSString *)title{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *time = [formatter stringFromDate:date];
    NSString *sql1 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@', '%@', '%@') VALUES ('%@', '%@', '%@', '%@', '%@')",
                      TABLENAME,@"message",@"time",@"type",@"order_id",@"title",message,time,type,orderId,title];
    [self execSql:sql1];
    sqlite3_close(db);
}


#pragma mark-----------------查询数据
-(NSMutableArray *)SelectData{
    NSMutableArray *array = [NSMutableArray array];
    NSString *sqlQuery =  [NSString stringWithFormat:@"SELECT * FROM message"];
    sqlite3_stmt * statement;
    
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *message = (char*)sqlite3_column_text(statement, 1);
            NSString *messageText = [[NSString alloc]initWithUTF8String:message];
            char *time = (char*)sqlite3_column_text(statement, 2);
            NSString *cidText = [[NSString alloc]initWithUTF8String:time];
            char *type = (char*)sqlite3_column_text(statement, 3);
            NSString *typeText = [[NSString alloc]initWithUTF8String:type];
            char *order_id = (char*)sqlite3_column_text(statement, 4);
            NSString *order_idText = [[NSString alloc]initWithUTF8String:order_id];
            char *title = (char*)sqlite3_column_text(statement, 5);
            NSString *titleText = [[NSString alloc]initWithUTF8String:title];
            MessageModel *model = [[MessageModel alloc] init];
            model.message = messageText;
            model.time = cidText;
            model.type = typeText;
            model.order_id = order_idText;
            model.title = titleText;
            [array addObject:model];
        }
    }
    sqlite3_close(db);
//    NSLog(@"%ld",array.count);
    
    return array;
}


-(void)deleteData
{
    sqlite3_stmt *statement;
    NSString *sqlStr = [NSString stringWithFormat:@"DELETE FROM message"];
    //        NSString *sqlStr = [NSString stringWithFormat:@"DELETE FROM PERSONINFO"];
    int result = sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL);
    if (result == SQLITE_OK) {
        if (sqlite3_step(statement) == SQLITE_ROW) {
            if (sqlite3_step(statement) == SQLITE_DONE) {
                sqlite3_finalize(statement);
                sqlite3_close(db);
            }
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(db);
}

@end
