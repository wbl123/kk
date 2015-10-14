//
//  RootTabBarController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "RootTabBarController.h"
#import "ActivityTableViewController.h"
#import "MoveTableViewController.h"
#import "CinemaTableViewController.h"
#import "UserTableViewController.h"

@interface RootTabBarController () <UITabBarControllerDelegate>

@property(nonatomic,strong)UIImage *image;

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_setupController];
    
}

-(void)p_setupController {
    
    ///  活动
    ActivityTableViewController *activityTVC = [[ActivityTableViewController alloc]initWithStyle:UITableViewStylePlain];
    UINavigationController *activityNC = [[UINavigationController alloc]initWithRootViewController:activityTVC];
    self.image = [UIImage imageNamed:@"activity.png"];
    activityNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"活动" image: self.image selectedImage:self.image];
    
    ///  电影
    MoveTableViewController *moveTVC = [[MoveTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
    UINavigationController *moveNC = [[UINavigationController alloc]initWithRootViewController:moveTVC];
    self.image = [UIImage imageNamed:@"movie.png"];
    moveNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"电影" image: self.image selectedImage:self.image];
    
    ///  影院
    CinemaTableViewController *cinema = [[CinemaTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
    UINavigationController *cinemaNC = [[UINavigationController alloc]initWithRootViewController:cinema];
    self.image = [UIImage imageNamed:@"cinema.png"];
    cinemaNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"影院" image: self.image selectedImage:self.image];
    
    ///  我的
    UserTableViewController *userTVC = [[UserTableViewController alloc]init];
    UINavigationController *userNC = [[UINavigationController alloc]initWithRootViewController:userTVC];
    self.image = [UIImage imageNamed:@"user.png"];
    userNC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image: self.image selectedImage:self.image];

    
    
    
    ////  输出
    self.viewControllers = @[activityNC,moveNC,cinemaNC,userNC];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
