//
//  UserTableViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/20.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "UserTableViewController.h"
#import "LoginViewController.h"

@interface UserTableViewController ()

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"我的";
    //  图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_nav@2x.png" ] forBarMetrics:UIBarMetricsDefault];
    //  Bar
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登陆" style:UIBarButtonItemStylePlain target:self action:@selector(rightBsrAction:)];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    //  注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的活动";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"我的电影";
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = @"清除缓存";
    }
    
    
    return cell;
}


//  右Bar
-(void)rightBsrAction:(UIBarButtonItem *)sender {
    
    //  模态写
//    [self.navigationController presentViewController:LoginVC animated:YES completion:^{
//        
//    }];

    LoginViewController * loginVC = [[LoginViewController alloc] init];
    UINavigationController * loginNC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    
    __block UserTableViewController * userVC = self;
    
    loginVC.successBlock = ^(id userInfo){
        
        NSLog(@"登陆成功");
        
        //设置登陆按钮
        [userVC p_setupLogoutButtonItem];
        
    };
    
    [self presentViewController:loginNC animated:YES completion:nil];

}

- (void)p_setupLogoutButtonItem
{
    UIBarButtonItem * closeButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(didClickCloseButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = closeButtonItem;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
