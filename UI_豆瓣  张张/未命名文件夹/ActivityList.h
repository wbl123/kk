//
//  ActivityList.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityList : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *begin_time;
@property(nonatomic,strong)NSString *end_time;
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *category_name;//活动类型
@property(nonatomic,strong)NSString *participant_count;//参加人数
@property(nonatomic,strong)NSString *wisher_count;//感兴趣人数
@property(nonatomic,strong)NSString *image;//活动图像(先显示占位图像)

@property(nonatomic,strong)NSDictionary *owner; //  含name 的字典
@property(nonatomic,strong)NSString *content;  ///  跳转的页面


@end
