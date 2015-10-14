//
//  MoveWebTableViewController.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoveList;

@interface MoveWebTableViewController : UITableViewController

@property(nonatomic,strong)MoveList *move;  //  保存MoveTableViewController的数据

@end
