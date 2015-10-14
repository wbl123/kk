//
//  DataBaseHandler.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/22.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "DataBaseHandler.h"
#import "User.h"

#import "sqlite3.h"

//  创建一个单例对象
static DataBaseHandler *dbhandler = nil;

@implementation DataBaseHandler

//  实现单例方法
+(instancetype)shareDataBase {                     ////  以后学多线程会改变的  *****
    if (dbhandler == nil) {
        dbhandler = [[DataBaseHandler alloc]init];
    }
    return dbhandler;
}

///  1  创建或打开数据库
///  创建一个数据库对象
static sqlite3 *sql1 = nil;

-(void)openDataBase{
    ///  获取沙盒下面 document 文件夹的路径
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *dataBasePath = [documentPath stringByAppendingString:@"/user.sqlite"];
    NSLog(@"%@",dataBasePath);
    
    
    ///  第一个参数是数据库的路径，第二个参数是指向数据库的指针
    int temp = sqlite3_open(dataBasePath.UTF8String, &sql1);

    if (temp == SQLITE_OK) {
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
    
}

-(void)createTable{
    
    //  准备SQL语句
    NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS STUDENT1 (number INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,name TEXT,gender TEXT)";
    
    //  执行SQL语句
    int temp = sqlite3_exec(sql1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (temp == SQLITE_OK) {
        NSLog(@"创建表成功");
    }else{
        NSLog(@"创建表失败");
    }
    
}



@end
