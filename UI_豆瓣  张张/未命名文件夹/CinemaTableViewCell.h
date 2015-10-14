//
//  CinemaTableViewCell.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *myLabelAddress;
@property(nonatomic,strong)UILabel *myLabelCinemaName;
@property(nonatomic,strong)UILabel *myLabelTeleohone;

@property(nonatomic,strong)UIImageView *bg; //  背景图片

@end
