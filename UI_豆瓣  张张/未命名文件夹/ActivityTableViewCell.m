//
//  ActivityTableViewCell.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

///  开始时间
-(UILabel *)myLabelBengin_time {
    if (_myLabelBengin_time == nil) {
      
        //  布局
        [self p_laout];
     
        
        self.myLabelBengin_time = [[UILabel alloc]initWithFrame:CGRectMake(35, 50, 100, 25)];
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
/// 地点
-(UILabel *)myLabelAddress {
    if (_myLabelAddress == nil) {
        self.myLabelAddress = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelBengin_time.frame), CGRectGetMaxY(self.myLabelBengin_time.frame) + 2, CGRectGetWidth(self.contentView.frame) -  CGRectGetWidth(self.myLabelBengin_time.frame) - 50 , CGRectGetHeight(self.myLabelBengin_time.frame))];
        
        [self.contentView addSubview:_myLabelAddress];
    }
    return _myLabelAddress;
}
///  类型  
-(UILabel *)myLabelCategory_name {
    if (_myLabelCategory_name == nil) {
        self.myLabelCategory_name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelAddress.frame), CGRectGetMaxY(self.myLabelAddress.frame) + 2, CGRectGetWidth(self.myLabelBengin_time.frame), CGRectGetHeight(self.myLabelBengin_time.frame))];
        
        [self.contentView addSubview:_myLabelCategory_name];
    }
    return _myLabelCategory_name;
}

///  兴趣人数
-(UILabel *)myLabelwisher_count {
    if (_myLabelwisher_count == nil) {
        self.myLabelwisher_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelAddress.frame), CGRectGetMaxY(self.contentView.frame) - 40, CGRectGetWidth(self.myLabelBengin_time.frame), CGRectGetHeight(self.myLabelBengin_time.frame))];
        
        [self.contentView addSubview:_myLabelwisher_count];
    }
    return _myLabelwisher_count;
}

///  参加人数
-(UILabel *)myLabelParticpant_count {
    if (_myLabelParticpant_count == nil) {
        self.myLabelParticpant_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myLabelwisher_count.frame) + 10, CGRectGetMaxY(self.contentView.frame) - 40, CGRectGetWidth(self.myLabelBengin_time.frame), CGRectGetHeight(self.myLabelBengin_time.frame))];
        [self.contentView addSubview:_myLabelParticpant_count];
    }
    return _myLabelParticpant_count;
}


////   题目
-(UILabel *)myLabelTitle {
    if (_myLabelTitle == nil) {
        self.myLabelTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 8, CGRectGetWidth(self.contentView.frame) - 30, 40)];
//        self.myLabelTitle.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myLabelTitle];
    }
    return _myLabelTitle;
}


/////  图片
-(UIImageView *)myImage {
    if (_myImage == nil) {
        self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.contentView.frame) - 105, 50, 90, 114)];
        // 占位图
        self.myImage.image = [UIImage imageNamed:@"picholder@2x.png"];        
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
    
    
}

-(void)p_laout{
    ///  蓝色的
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + 5, CGRectGetMinY(self.contentView.frame) + 8, CGRectGetWidth(self.contentView.frame) - 10, CGRectGetHeight(self.contentView.frame) - 15)];
    bg.image = [UIImage imageNamed:@"bg_eventlistcell@2x.png"];
    [self.contentView addSubview:bg];
    
    ///  白色的
    UIImageView *bg2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(bg.frame) + 3, CGRectGetMinY(bg.frame) + 37, CGRectGetWidth(bg.frame) - 6, CGRectGetHeight(bg.frame) - 43)];
    bg2.image = [UIImage imageNamed:@"bg_share_large@2x.png"];
    [self.contentView addSubview:bg2];    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
