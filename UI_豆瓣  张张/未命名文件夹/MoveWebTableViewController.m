//
//  MoveWebTableViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/19.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "MoveWebTableViewController.h"
#import "MoveWebTableViewCell.h"
#import "MoveWebList.h"
#import "MoveList.h"

#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface MoveWebTableViewController ()

@property(nonatomic,strong)MoveWebList *dataMove;
@property (nonatomic,retain) MBProgressHUD * hud;  //  小菊花

@end

@implementation MoveWebTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_nav@2x.png" ] forBarMetrics:UIBarMetricsDefault];
    
    //  注册
    [self.tableView registerClass:[MoveWebTableViewCell class] forCellReuseIdentifier:@"cell"];
    //  初始化
    self.dataMove = [[MoveWebList alloc]init];
    [self p_data];
    [self p_setupProgressHud];  //  小菊花  引用
    //  Bar按键
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_share@2x.png"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBArAction:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_back@2x.png"] style:(UIBarButtonItemStyleDone) target:self action:@selector(lefttBarAction:)];

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
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoveWebTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //  头Bar
    self.navigationItem.title = self.dataMove.title;
    //  图片
    [cell.myPoster sd_setImageWithURL:[NSURL URLWithString: self.dataMove.poster]];
    //  评分
    cell.myLabelRating.text = [NSString stringWithFormat:@"评分：%@", self.dataMove.rating];
    cell.myLabelRating.font = [UIFont systemFontOfSize:15.0];
    //  评分人数
    cell.myLabelRating_count.text = [NSString stringWithFormat:@"(%@评论)", self.dataMove.rating_count];
    cell.myLabelRating_count.font = [UIFont systemFontOfSize:15.0];
    //  上映时间
    cell.myLabelrelease_date.text = self.dataMove.release_date;
    cell.myLabelrelease_date.font = [UIFont systemFontOfSize:15.0];
    //  播放时间
    cell.myLabelruntime.text = self.dataMove.runtime;
    cell.myLabelruntime.font = [UIFont systemFontOfSize:15.0];
    //  分类
    cell.myLabelGenres.text = self.dataMove.genres;
    cell.myLabelGenres.font = [UIFont systemFontOfSize:15.0];
    //  国家
    cell.myLabelContry.text = self.dataMove.country;
    cell.myLabelContry.font = [UIFont systemFontOfSize:15.0];
    
    //  演员
    cell.myLabelactors.text = self.dataMove.actors;
    cell.myLabelactors.font = [UIFont systemFontOfSize:15.0];
    cell.myLabelactors.numberOfLines = 0;
    ///  自适应高度 的 View
    CGFloat tempHeight1 = [self heightForString:self.dataMove.actors];
    cell.myLabelactors.frame = CGRectMake(cell.myLabelactors.frame.origin.x, cell.myLabelactors.frame.origin.y, cell.myLabelactors.frame.size.width, tempHeight1);
    
    
    //  简介
    cell.myLabelplot_simple.text = self.dataMove.plot_simple;
    cell.myLabelplot_simple.font = [UIFont systemFontOfSize:15.0];
    cell.myLabelplot_simple.numberOfLines = 0;
    ///  自适应高度 的 View
    CGFloat tempHeight2 = [self heightForString:self.dataMove.plot_simple];
    cell.myLabelplot_simple.frame = CGRectMake(cell.myLabelplot_simple.frame.origin.x, CGRectGetMaxY(cell.myLabelactors.frame) + 50, cell.myLabelplot_simple.frame.size.width, tempHeight2);
    
    ///  写死在外面
    cell.bg.text = @"电影情节";
    cell.bg.frame = CGRectMake(CGRectGetMinX(cell.bg.frame), CGRectGetMinY(cell.myLabelplot_simple.frame) - 40, CGRectGetWidth(cell.bg.frame), CGRectGetHeight(cell.bg.frame));
    
    return cell;
}

-(void)p_data {
    ////  1 准备URL
    //拼接网址，需要使用 电影列表页面中得到的电影编号，根据电影编号获取某个电影的详情
    NSString *temp = @"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php";
    NSString * urlString = [NSString stringWithFormat:@"%@?movieId=%@" , temp , self.move.movieId];
    NSURL * url = [NSURL URLWithString:urlString];

    //http://project.lanou3g.com/teacher/yihuiyun/lanouproject/searchmovie.php?movieId=190537
    
    //  2 准备请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //  3 异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:([NSOperationQueue mainQueue]) completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
//        NSLog(@"%@",dict);
        [_hud hide:YES];   /// 小菊花   使用的地方
       
        [self.dataMove setValuesForKeysWithDictionary: [dict objectForKey:@"result"] ];
    
        ///  重新刷新数据，否则显示不出来
        [self.tableView reloadData];
        
        
    }];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 164 + [self heightForString:self.dataMove.actors] + 50 + [self heightForString:self.dataMove.plot_simple] + 50;  //  自适应高度
}

///  自适应高度
-(CGFloat)heightForString:(NSString *)aString {
    
    ////   调字典   NSFontAttributeName   ******  记者
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:15.5]};
    
    
    ////  把传进来的字符串放在一个假想 的 矩形中
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.tableView.frame) - 60, 2000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes: dict  context:nil];
    
    return rect.size.height;
    
}



//  左按键
-(void)lefttBarAction:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//  右按键
-(void)rightBArAction:(UIBarButtonItem *)sender {
    
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
