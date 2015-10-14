//
//  ActivityWebTableViewCell.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "ActivityWebTableViewCell.h"

@implementation ActivityWebTableViewCell

///  开始时间
-(UILabel *)myLabelBengin_time {
    if (_myLabelBengin_time == nil) {        
        self.myLabelBengin_time = [[UILabel alloc]initWithFrame:CGRectMake(150, 78, 100, 25)];
        //        self.myLabelBengin_time.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myLabelBengin_time];
    }
    return _myLabelBengin_time;
}
///  结束时间
-(UILabel *)myLabelEnd_time {
    if (_myLabelEnd_time == nil) {
        self.myLabelEnd_time = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myLabelBengin_time.frame) - 10 , CGRectGetMinY(self.myLabelBengin_time.frame), CGRectGetWidth(self.myLabelBengin_time.frame) + 35, CGRectGetHeight(self.myLabelBengin_time.frame))];
        
        [self.contentView addSubview:_myLabelEnd_time];
    }
    return _myLabelEnd_time;
}
///  名字
-(UILabel *)myLabelName {
    
    if (_myLabelName == nil) {
        self.myLabelName = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelBengin_time.frame), CGRectGetMaxY(self.myLabelBengin_time.frame) + 2, CGRectGetWidth(self.contentView.frame) -  CGRectGetWidth(self.myLabelBengin_time.frame) - 50 , CGRectGetHeight(self.myLabelBengin_time.frame) )];
        
        [self.contentView addSubview:_myLabelName];
    }
    return _myLabelName;

}

///  类型
-(UILabel *)myLabelCategory_name {
    if (_myLabelCategory_name == nil) {
        self.myLabelCategory_name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelName.frame), CGRectGetMaxY(self.myLabelName.frame) + 2, CGRectGetWidth(self.myLabelBengin_time.frame), CGRectGetHeight(self.myLabelBengin_time.frame))];
        
        [self.contentView addSubview:_myLabelCategory_name];
    }
    return _myLabelCategory_name;
}

/// 地点
-(UILabel *)myLabelAddress {
    if (_myLabelAddress == nil) {
        self.myLabelAddress = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelBengin_time.frame), CGRectGetMaxY(self.myLabelCategory_name.frame) + 2, CGRectGetWidth(self.contentView.frame) -  CGRectGetWidth(self.myLabelBengin_time.frame) - 60 , CGRectGetHeight(self.myLabelBengin_time.frame) * 2 - 10)];
        
        [self.contentView addSubview:_myLabelAddress];
    }
    return _myLabelAddress;
}

////   题目
-(UILabel *)myLabelTitle {
    if (_myLabelTitle == nil) {
        self.myLabelTitle = [[UILabel alloc]initWithFrame:CGRectMake(30, 8, CGRectGetWidth(self.contentView.frame) - 60, 60)];
//        self.myLabelTitle.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myLabelTitle];
    }
    return _myLabelTitle;
}


/////  图片
-(UIImageView *)myImage {
    if (_myImage == nil) {
        self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 78, 90, 124)];
        //        self.myImage.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myImage];
        
        
        //  小图片
        [self p_slaout];
        
        
    }
    return _myImage;
}


-(void)p_slaout {
    ///1
    UIImageView *image1 = [[UIImageView alloc]init];
    image1.frame = CGRectMake(CGRectGetMinX(self.myLabelBengin_time.frame) - 25, CGRectGetMinY(self.myLabelBengin_time.frame), 25, 25) ;
    image1.image = [UIImage imageNamed:@"icon_date_blue@2x.png"];
    [self.contentView addSubview:image1];
    ///2
    UIImageView *image2 = [[UIImageView alloc]init];
    image2.frame = CGRectMake(CGRectGetMinX(self.myLabelAddress.frame) - 25, CGRectGetMinY(self.myLabelAddress.frame), 25, 25) ;
    image2.image = [UIImage imageNamed:@"icon_spot_blue@2x.png"];
    [self.contentView addSubview:image2];
    ///3
    UIImageView *image3 = [[UIImageView alloc]init];
    image3.frame = CGRectMake(CGRectGetMinX(self.myLabelCategory_name.frame) - 25, CGRectGetMinY(self.myLabelCategory_name.frame), 25, 25) ;
    image3.image = [UIImage imageNamed:@"icon_catalog_blue@2x.png"];
    [self.contentView addSubview:image3];
    ///  name
    UIImageView *image4 = [[UIImageView alloc]init];
    image4.frame = CGRectMake(CGRectGetMinX(self.myLabelName.frame) - 25, CGRectGetMinY(self.myLabelName.frame), 25, 25) ;
    image4.image = [UIImage imageNamed:@"icon_sponsor_blue@2x.png"];
    [self.contentView addSubview:image4];
   
    
}

///  活动介绍
-(UILabel *)myLabelContent{
    if (_myLabelContent == nil) {
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(30, 230, 100, 40)];
        title.text = @"活动介绍";
        title.font = [UIFont systemFontOfSize:19.0];
        [self.contentView addSubview:title];
        
        self.myLabelContent = [[UILabel alloc]initWithFrame:CGRectMake(30, 250, CGRectGetWidth(self.contentView.frame) - 60, 0)];
//        self.myLabelContent.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myLabelContent];
    }
    return _myLabelContent;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
