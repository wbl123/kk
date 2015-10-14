//
//  ActivityWebTableViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "ActivityWebTableViewController.h"
#import "ActivityWebTableViewCell.h"
#import "ActivityList.h"

#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"

@interface ActivityWebTableViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSString * tempContent;
@property (nonatomic,retain) MBProgressHUD * hud;  //  小菊花

@end

@implementation ActivityWebTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"bg_nav@2x.png" ] forBarMetrics:UIBarMetricsDefault];
    
    //  注册
    [self.tableView registerClass:[ActivityWebTableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
    ActivityWebTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
   // ActivityList *a = self.dataArr[indexPath.row];
    [_hud hide:YES];   /// 小菊花   使用的地方
    
    ActivityList *a = self.activity;
    //  标题
    self.navigationItem.title = a.title;
    
    //  开始时间
    cell.myLabelBengin_time.text = [a.begin_time substringWithRange:NSMakeRange(5, 11)];
    cell.myLabelBengin_time.font = [UIFont systemFontOfSize:15.0];
    //  结束时间
    cell.myLabelEnd_time.text = [NSString stringWithFormat:@"-- %@", [a.end_time substringWithRange:NSMakeRange(5, 11)] ];
    cell.myLabelEnd_time.font = [UIFont systemFontOfSize:15.0];
    
    //  名字
    cell.myLabelName.text = [a.owner objectForKey:@"name"];
    cell.myLabelName.font = [UIFont systemFontOfSize:15.0];
    
    //  地址
    cell.myLabelAddress.text = a.address;
    cell.myLabelAddress.font = [UIFont systemFontOfSize:15.0];
    cell.myLabelAddress.numberOfLines = 2;
    
    ///  类型
    cell.myLabelCategory_name.text = [NSString stringWithFormat:@"类型：%@", a.category_name];
    cell.myLabelCategory_name.font = [UIFont systemFontOfSize:15.0];

    //  标题
    cell.myLabelTitle.text = a.title;
    cell.myLabelTitle.font = [UIFont systemFontOfSize:19.0];
    cell.myLabelTitle.numberOfLines = 2;
    
    // 占位图
    cell.myImage.image = [UIImage imageNamed:@"picholder@2x.png"];
    
    [cell.myImage sd_setImageWithURL:[NSURL URLWithString:a.image]];
    
    ///  内容
    cell.myLabelContent.text = a.content;
    cell.myLabelContent.font = [UIFont systemFontOfSize:14.5];
    cell.myLabelContent.numberOfLines = 0;
    
    ///  自适应高度 的 View
    self.tempContent = a.content;
    CGFloat tempHeight = [self heightForString:self.tempContent];

    cell.myLabelContent.frame = CGRectMake(cell.myLabelContent.frame.origin.x, cell.myLabelContent.frame.origin.y, cell.myLabelContent.frame.size.width - 20, tempHeight);
    
    return cell;
}

///   自适应高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 230 + [self heightForString:self.tempContent];  ///  调用下面的
}

-(CGFloat)heightForString:(NSString *)aString {
    
    ////   调字典   NSFontAttributeName   ******  记者
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:15.5]};
    
    
    ////  把传进来的字符串放在一个假想 的 矩形中
    CGRect rect = [aString boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.tableView.frame) - 60, 2000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes: dict  context:nil];
    
    return rect.size.height;
    
}

//  右按键
-(void)rightBArAction:(UIBarButtonItem *)sender {
    
}
//  左按键
-(void)lefttBarAction:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
