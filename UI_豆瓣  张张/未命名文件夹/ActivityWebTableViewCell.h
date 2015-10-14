//
//  ActivityWebTableViewCell.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityWebTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *myImage;
@property(nonatomic,strong)UILabel *myLabelTitle;
@property(nonatomic,strong)UILabel *myLabelBengin_time;
@property(nonatomic,strong)UILabel *myLabelEnd_time;
@property(nonatomic,strong)UILabel *myLabelAddress;
@property(nonatomic,strong)UILabel *myLabelCategory_name;

@property(nonatomic,strong)UILabel *myLabelName;
@property(nonatomic,strong)UILabel *myLabelContent;

@end
