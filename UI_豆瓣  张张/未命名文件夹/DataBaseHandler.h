//
//  DataBaseHandler.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/22.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

///    单例类
@interface DataBaseHandler : NSObject

+(instancetype)shareDataBase;

///  1 创建打开数据库
-(void)openDataBase;

-(void)createTable;

//#pragma mark   User表
/////  2 创建一个表
//-(void)createTable;
/////  3 增加（插入）
//-(void)insertStudent:(User *)aUser;



@end
