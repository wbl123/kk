//
//  MoveWebTableViewCell.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "MoveWebTableViewCell.h"

@implementation MoveWebTableViewCell
//  图片
-(UIImageView *)myPoster{
    if (_myPoster == nil) {
        self.myPoster = [[UIImageView alloc]initWithFrame:CGRectMake(30, 30, 100, 134)];
        // 占位图
        self.myPoster.image = [UIImage imageNamed:@"picholder@2x.png"];
        [self.contentView addSubview:_myPoster];
    }
    return _myPoster;
}
//  评分
-(UILabel *)myLabelRating{
    if (_myLabelRating == nil) {
        self.myLabelRating = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myPoster.frame) + 30, CGRectGetMinY(self.myPoster.frame), 70, 23)];
        [self.contentView addSubview:_myLabelRating];
    }
    return _myLabelRating;
}
//  评论人
-(UILabel *)myLabelRating_count{
    if (_myLabelRating_count == nil) {
        self.myLabelRating_count = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.myLabelRating.frame) + 20, CGRectGetMinY(self.myLabelRating.frame), CGRectGetWidth(self.myLabelRating.frame) + 30, CGRectGetHeight(self.myLabelRating.frame))];
        [self.contentView addSubview:_myLabelRating_count];
    }
    return _myLabelRating_count;
    
}
//  上映时间
-(UILabel *)myLabelrelease_date{
    if (_myLabelrelease_date == nil) {
        self.myLabelrelease_date = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelRating.frame), CGRectGetMaxY(self.myLabelRating.frame) + 3.5, CGRectGetWidth(self.contentView.frame) - CGRectGetWidth(self.myPoster.frame) - 95, CGRectGetHeight(self.myLabelRating.frame) )];
        [self.contentView addSubview:_myLabelrelease_date];
    }
    return _myLabelrelease_date;
}

//  时间
-(UILabel *)myLabelruntime{
    if (_myLabelruntime == nil) {
        self.myLabelruntime = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelRating.frame), CGRectGetMaxY(self.myLabelrelease_date.frame) + 3.5, CGRectGetWidth(self.myLabelrelease_date.frame), CGRectGetHeight(self.myLabelRating.frame) )];
        [self.contentView addSubview:_myLabelruntime];
    }
    return _myLabelruntime;

}

//  分类
-(UILabel *)myLabelGenres{
    if (_myLabelGenres == nil) {
        self.myLabelGenres = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelRating.frame), CGRectGetMaxY(self.myLabelruntime.frame) + 3.5, CGRectGetWidth(self.myLabelrelease_date.frame), CGRectGetHeight(self.myLabelRating.frame) )];
        [self.contentView addSubview:_myLabelGenres];
    }
    return _myLabelGenres;
}

//  国家
-(UILabel *)myLabelContry{
    if (_myLabelContry == nil) {
        self.myLabelContry = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelRating.frame), CGRectGetMaxY(self.myLabelGenres.frame) + 3.5, CGRectGetWidth(self.myLabelrelease_date.frame), CGRectGetHeight(self.myLabelRating.frame) )];
        [self.contentView addSubview:_myLabelContry];
    }
    return _myLabelContry;
}

//  制作人
-(UILabel *)myLabelactors{
    if (_myLabelactors == nil) {
        self.myLabelactors = [[UILabel alloc]initWithFrame:CGRectMake(30, 164 + 50, CGRectGetWidth(self.contentView.frame) - 60, 80 )];
//        self.myLabelactors.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myLabelactors];

        [self p_palout];
    }
    return _myLabelactors;

}

//  电影情节
-(UILabel *)myLabelplot_simple{
    if (_myLabelplot_simple == nil) {
        self.myLabelplot_simple = [[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.myLabelactors.frame) + 50, CGRectGetWidth(self.contentView.frame) - 60, 0 )];
//        self.myLabelplot_simple.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_myLabelplot_simple];
        
    }
    return _myLabelplot_simple;
}

-(void)p_palout{
    UILabel *bg1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelactors.frame), CGRectGetMinY(self.myLabelactors.frame) - 40, 100, 40)];
    bg1.text = @"制作人";
    bg1.font = [UIFont systemFontOfSize:19.0];
    [self.contentView addSubview:bg1];

}

///  电影情节
-(UILabel *)bg{
    if (_bg == nil) {
        self.bg = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.myLabelactors.frame), 0, 100, 40)];
        self.bg.text = @"电影情节";
        self.bg.font = [UIFont systemFontOfSize:19.0];
        [self.contentView addSubview:_bg];
        
    }
    return _bg;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
