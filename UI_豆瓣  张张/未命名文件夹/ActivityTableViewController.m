//
//  ActivityTableViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "ActivityTableViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityList.h"
#import "ActivityWebTableViewController.h"

#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface ActivityTableViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,retain) MBProgressHUD * hud;  //  小菊花

@end

@implementation ActivityTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"活动";
    
    //  图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_nav@2x.png" ] forBarMetrics:UIBarMetricsDefault];
    
    self.dataArr = [NSMutableArray array];

    [self p_setupProgressHud];  //  小菊花  引用
    [self p_data];
    
    //  注册
    [self.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //  取消线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    ActivityList *a = self.dataArr[indexPath.row];
    //  开始时间
    cell.myLabelBengin_time.text = [a.begin_time substringWithRange:NSMakeRange(5, 11)];
    cell.myLabelBengin_time.font = [UIFont systemFontOfSize:15.0];
    //  结束时间
    cell.myLabelEnd_time.text = [NSString stringWithFormat:@"-- %@", [a.end_time substringWithRange:NSMakeRange(5, 11)] ];
    cell.myLabelEnd_time.font = [UIFont systemFontOfSize:15.0];
    
    //  地址
    cell.myLabelAddress.text = a.address;
    cell.myLabelAddress.font = [UIFont systemFontOfSize:15.0];
    
    cell.myLabelCategory_name.text = [NSString stringWithFormat:@"类型：%@", a.category_name];
    cell.myLabelCategory_name.font = [UIFont systemFontOfSize:15.0];
    
    cell.myLabelwisher_count.text = [NSString stringWithFormat:@"感兴趣：%@", a.wisher_count];
    cell.myLabelwisher_count.font = [UIFont systemFontOfSize:13.0];
    
    cell.myLabelParticpant_count.text = [NSString stringWithFormat:@"参加：%@",a.participant_count];
    cell.myLabelParticpant_count.font = [UIFont systemFontOfSize:13.0];
    
    cell.myLabelTitle.text = a.title;
    cell.myLabelTitle.font = [UIFont systemFontOfSize:19.0];
    
    ///  图片
    [cell.myImage sd_setImageWithURL:[NSURL URLWithString:a.image]];
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 185;
}

-(void)p_data {
    ///  1 准备URL
    NSString *urlStr = [NSString stringWithFormat:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/activitylist.php"];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    //  2 准备请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //  3 异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        
//        NSLog(@"%@",dict);
                 [_hud hide:YES];   /// 小菊花   使用的地方
        
        for (NSDictionary *d in [dict objectForKey:@"events"]) {
            ActivityList *a = [[ActivityList alloc]init];
            ///  KVC
            [a setValuesForKeysWithDictionary: d ];
            [self.dataArr addObject: a];
            
        }
        
        ///  重新刷新数据，否则显示不出来
        [self.tableView reloadData];
        
    }];
    
    
}

////  按键效果
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityWebTableViewController *web = [[ActivityWebTableViewController alloc]init];
    
    //传值
    ActivityList * activity =  _dataArr[indexPath.row];
    web.activity = activity;
    
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
