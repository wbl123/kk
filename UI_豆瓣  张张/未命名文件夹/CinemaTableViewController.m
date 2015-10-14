//
//  CinemaTableViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/17.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "CinemaTableViewController.h"
#import "CinemaTableViewCell.h"
#import "Cinema.h"

#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface CinemaTableViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSString *tempAddrss;  //  临时存储，用于地质的自适应高度
@property (nonatomic,retain) MBProgressHUD * hud;  //  小菊花

@end

@implementation CinemaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"影院";
    //  图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_nav@2x.png" ] forBarMetrics:UIBarMetricsDefault];
    
    self.dataArr = [NSMutableArray array];
   
    [self p_data];
    [self p_setupProgressHud];  //  小菊花  引用
    
    //  注册
    [self.tableView registerClass:[CinemaTableViewCell class] forCellReuseIdentifier:@"cell"];
    ///  取消线
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
    CinemaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Cinema *c = self.dataArr[indexPath.row];
    
    cell.myLabelCinemaName.text = c.cinemaName;
    cell.myLabelCinemaName.font = [UIFont systemFontOfSize:19.0];
    
    cell.myLabelAddress.text = c.address;
    cell.myLabelAddress.font = [UIFont systemFontOfSize:14.0];
    cell.myLabelAddress.numberOfLines = 2;
    ///  自适应高度 的 View
    CGFloat tempHeight1 = [self heightForString:c.address];
    cell.myLabelAddress.frame = CGRectMake(cell.myLabelAddress.frame.origin.x, cell.myLabelAddress.frame.origin.y, cell.myLabelAddress.frame.size.width, tempHeight1);
    self.tempAddrss = c.address;
    
    cell.myLabelTeleohone.text = c.telephone;
    cell.myLabelTeleohone.font = [UIFont systemFontOfSize:14.0];
    ///  自适应高度 的 View
    cell.myLabelTeleohone.frame = CGRectMake(cell.myLabelTeleohone.frame.origin.x, CGRectGetMaxY(cell.myLabelAddress.frame) + 10, cell.myLabelTeleohone.frame.size.width, cell.myLabelTeleohone.frame.size.height);
    
    //  背景图片
    cell.bg.frame = CGRectMake(cell.bg.frame.origin.x, cell.bg.frame.origin.y, cell.bg.frame.size.width, 95 + [self heightForString:self.tempAddrss]);;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 105 + [self heightForString:self.tempAddrss];
}

///  自适应高度
-(CGFloat)heightForString:(NSString *)aString {
    
    ////   调字典   NSFontAttributeName   ******  记者
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:14.0]};
    
    
    ////  把传进来的字符串放在一个假想 的 矩形中
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.tableView.frame) - 20, 2000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes: dict  context:nil];
    
    return rect.size.height;
    
}


-(void)p_data {
    ////  1 准备URL
    NSURL *url = [NSURL URLWithString:@"http://project.lanou3g.com/teacher/yihuiyun/lanouproject/cinemalist.php"];
    //  2 准备请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //  3 异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:([NSOperationQueue mainQueue]) completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
//        NSLog(@"%@",dict);
        [_hud hide:YES];   /// 小菊花   使用的地方
        
        for (NSDictionary *d in [[dict objectForKey:@"result"] objectForKey:@"data"]) {
            Cinema *c = [[Cinema alloc]init];
            ///  KVC
            [c setValuesForKeysWithDictionary: d ];
            [self.dataArr addObject: c];
            
        }
        ///  重新刷新数据，否则显示不出来
        [self.tableView reloadData];
        
        
    }];
    
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
