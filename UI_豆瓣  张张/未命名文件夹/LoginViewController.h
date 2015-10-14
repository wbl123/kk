//
//  LoginViewController.h
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/21.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LoginSuccessBlock)(id userInfo);

@interface LoginViewController : UIViewController

@property (nonatomic,copy) LoginSuccessBlock successBlock;//登陆成功后回调

@end
