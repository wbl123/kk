//
//  MoveTableViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "MoveTableViewController.h"
#import "MoveTableViewCell.h"
#import "MoveList.h"
#import "Move2ViewController.h"
#import "MoveWebTableViewController.h"

#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface MoveTableViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,retain) MBProgressHUD * hud;  //  小菊花

@end

@implementation MoveTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"电影";
    //  图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_nav@2x.png" ] forBarMetrics:UIBarMetricsDefault];
    
    self.dataArr = [NSMutableArray array];
    [self p_data];
    [self p_setupProgressHud];  //  小菊花  引用
    
    ///  注册
    [self.tableView registerClass:[MoveTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    ///  右按键
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_collection@2x.png"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItemAction:)];
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
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    MoveList *m = self.dataArr[indexPath.row];
    
    //  图片
    [cell.myImage sd_setImageWithURL:[NSURL URLWithString:m.pic_url]];
    
    ///  标题
    cell.myLabel.text = m.movieName;
    cell.myLabel.font = [UIFont systemFontOfSize:19.0];
    
    return cell;
}

-(void)p_data {
    ////  1 准备URL
    NSURL *url = [NSURL URLWithString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/movielist.php"];
    //  2 准备请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //  3 异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:([NSOperationQueue mainQueue]) completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
      
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
//        NSLog(@"%@",dict);
    [_hud hide:YES];   /// 小菊花   使用的地方

        
        for (NSDictionary *d in [dict objectForKey:@"result"]) {
            MoveList *a = [[MoveList alloc]init];
            ///  KVC
            [a setValuesForKeysWithDictionary: d ];
            [self.dataArr addObject: a];

        }
        ///  重新刷新数据，否则显示不出来
        [self.tableView reloadData];
       
        
    }];
    
}

///  右上角按键
-(void)rightBarButtonItemAction:(UIBarButtonItem *)sender {
    Move2ViewController *m2 = [[Move2ViewController alloc]init];
    
    [self.navigationController pushViewController:m2 animated:YES];
    
    
}

//  按键效果
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MoveWebTableViewController *web = [[MoveWebTableViewController alloc]init];
    
    // 传值
    MoveList *move = _dataArr[indexPath.row];
    web.move = move;
    
    [self.navigationController pushViewController:web animated:YES];
    
}

///  第三方。小菊花
- (void)p_setupProgressHud
{
    self.hud = [[MBProgressHUD alloc] initWithView:self.tableView];
    _hud.frame = self.tableView.bounds;
    _hud.minSize = CGSizeMake(80, 80);
    _hud.mode = MBProgressHUDModeIndeterminate;
    [self.tableView addSubview:_hud];
    //    NSLog(@"小菊花");
    [_hud show:YES];
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
