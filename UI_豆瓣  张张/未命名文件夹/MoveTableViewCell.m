//
//  MoveTableViewCell.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "MoveTableViewCell.h"

@implementation MoveTableViewCell

-(UIImageView *)myImage{
    if (_myImage == nil) {
        
        //  背景图片
        [self p_laout];
        
        
        self.myImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 12, 90, 125)];
        
        [self.contentView addSubview:_myImage];
      
    }
    return _myImage;
}

-(UILabel *)myLabel {
    if (_myLabel == nil) {
        self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myImage.frame) + 15, CGRectGetMaxY(self.contentView.frame) / 2 - 15, CGRectGetMaxX(self.contentView.frame) - CGRectGetWidth(self.myImage.frame) - 45, 30)];
//        self.myLabel.backgroundColor = [UIColor orangeColor];
        
        ///  占位图
        self.myImage.image = [UIImage imageNamed:@"picholder@2x.png"];
        
        [self.contentView addSubview:_myLabel];
        
    }
    return _myLabel;
}


-(void)p_laout{
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.contentView.frame) + 5, CGRectGetMinY(self.contentView.frame) + 8, CGRectGetWidth(self.contentView.frame) - 10, CGRectGetHeight(self.contentView.frame) - 16)];
    
    bg.image = [UIImage imageNamed:@"bg_eventlistcell@2x.png"];
    [self.contentView addSubview:bg];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
