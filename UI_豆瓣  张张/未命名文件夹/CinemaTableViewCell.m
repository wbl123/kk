//
//  CinemaTableViewCell.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell

//  写一个两个都可以进行
-(UILabel *)myLabelCinemaName {
    ///  头
    if (_myLabelCinemaName == nil) {
        
        [self p_laout];
        
        self.myLabelCinemaName = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.contentView.frame) - 20, 40)];                
        [self.contentView addSubview:_myLabelCinemaName];
/////  地址
        self.myLabelAddress = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelCinemaName.frame), CGRectGetMaxY(self.myLabelCinemaName.frame) + 10, CGRectGetWidth(self.contentView.frame) - 20, 0)];  ///  高
//        self.myLabelAddress.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myLabelAddress];
/////  电话
        self.myLabelTeleohone = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelCinemaName.frame), 0, CGRectGetWidth(self.contentView.frame) - 20, 25)];  //  y值
        
        [self.contentView addSubview:_myLabelTeleohone];
    }

    return _myLabelCinemaName;
}


-(void)p_laout{
    
    ///  蓝色的
    self.bg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + 5, CGRectGetMinY(self.contentView.frame) + 8, CGRectGetWidth(self.contentView.frame) - 10, 0)];
    self.bg.image = [UIImage imageNamed:@"bg_eventlistcell@2x.png"];
    [self.contentView addSubview:self.bg];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
