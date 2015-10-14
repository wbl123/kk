//
//  MoveWebList.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoveWebList : NSObject

@property(nonatomic,strong)NSString *poster;  //  图片
@property(nonatomic,strong)NSString *title;  //  标题
@property(nonatomic,strong)NSString *rating;  //  评分
@property(nonatomic,strong)NSString *rating_count;  // 评论人数
@property(nonatomic,strong)NSString *release_date;  //  上映时间
@property(nonatomic,strong)NSString *runtime;  //  时间
@property(nonatomic,strong)NSString *genres;  //  分类
@property(nonatomic,strong)NSString *country;  //  国家
@property(nonatomic,strong)NSString *actors;  // 演员
@property(nonatomic,strong)NSString *plot_simple;  //  简介

//@property(nonatomic,strong)NSString *movieid;

@end
