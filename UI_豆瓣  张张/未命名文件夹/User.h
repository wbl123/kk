//
//  User.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/22.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic,assign)NSInteger number;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *Email;
@property(nonatomic,strong)NSString *phoneNum;

@end
