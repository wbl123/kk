//
//  Move2ViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "Move2ViewController.h"
#import "MoveList.h"

#import "UIImageView+WebCache.h"

@interface Move2ViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UIImageView *myImage;
@property(nonatomic,strong)UILabel *myLabel;

@end

@implementation Move2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /////  隐藏掉系统默认按键
    self.navigationItem.hidesBackButton = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_nav_list@2x.png"] style:(UIBarButtonItemStyleDone) target:self action:@selector(rightBarButtonItemAction)];
    
    [self p_data];
    
    [self p_show];
    
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
        
        for (NSDictionary *d in [dict objectForKey:@"result"]) {
            MoveList *a = [[MoveList alloc]init];
            ///  KVC
            [a setValuesForKeysWithDictionary: d ];
            [self.dataArr addObject: a];
            
        }
//        ///  重新刷新数据，否则显示不出来
//        [self.tableView reloadData];
        
    }];
    
}

-(void)p_show{
    
//    int n = 0;
//
//    for (int i = 0; i < self.dataArr.count + 1; i ++) {
//        for (int j = 0; j < 3; j++) {
//            
//            self.myLabel = [[UILabel alloc]init];
//            self.myLabel.frame = CGRectMake(40 + j * 88, 130 + i * 88 , 110, 100);
//            [self.myLabel setBackgroundImage:[UIImage imageNamed:[self.dataArr[n] objectAtIndex: n]] forState:UIControlStateNormal];
//            n ++;
//            ////
//            [self.Button1 addTarget:self action:@selector(myPhoneButton :) forControlEvents:UIControlEventTouchUpInside];
//            [self.window addSubview:self.Button1];
//        }
//    }

    
}



//  左按键
-(void)rightBarButtonItemAction {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
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
