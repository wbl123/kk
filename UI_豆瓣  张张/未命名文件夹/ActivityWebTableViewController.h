//
//  ActivityWebTableViewController.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityList;

@interface ActivityWebTableViewController : UITableViewController

@property(nonatomic,strong)ActivityList *activity;  //  用于跳转页面传值

@end
