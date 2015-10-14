//
//  MoveWebTableViewCell.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoveWebTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *myPoster;  //  图片
@property(nonatomic,strong)UILabel *myLabelTitle;  //  标题
@property(nonatomic,strong)UILabel *myLabelRating;  //  评分
@property(nonatomic,strong)UILabel *myLabelRating_count;  // 评论人数
@property(nonatomic,strong)UILabel *myLabelrelease_date;  //  上映时间
@property(nonatomic,strong)UILabel *myLabelruntime;  //  时间
@property(nonatomic,strong)UILabel *myLabelGenres;  //  分类
@property(nonatomic,strong)UILabel *myLabelContry;  //  国家
@property(nonatomic,strong)UILabel *myLabelactors;  // 演员
@property(nonatomic,strong)UILabel *myLabelplot_simple;  //  简介

@property(nonatomic,strong)UILabel *bg;

@end
