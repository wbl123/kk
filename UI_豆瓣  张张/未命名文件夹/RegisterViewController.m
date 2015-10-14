//
//  RegisterViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/21.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "RegisterViewController.h"
#import "DataBaseHandler.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    DataBaseHandler *h = [DataBaseHandler
                           shareDataBase];

    
    [h  openDataBase];
    
    
    
    
    
    self.navigationItem.title = @"登陆";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction:)];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"用户登陆" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarAction:)];
    
    [self p_laout];
}

//  左按键
-(void)leftBarAction:(UIBarButtonItem *)sender{
    ///  模态隐藏
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

///  右按键
-(void)rightBarAction:(UIBarButtonItem *)sender{
    ////  写入（添加）数据库
}

-(void)p_laout{
    UILabel *nameView = [[UILabel alloc]initWithFrame:CGRectMake(50, 120, 80, 30)];
    UILabel *passwordView = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(nameView.frame), CGRectGetMaxY(nameView.frame)+20, 120, 30)];
    UITextField *Label1 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameView.frame)+20, CGRectGetMinY(nameView.frame), 170, 30)];
    UITextField *Label2 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMinX(Label1.frame), CGRectGetMinY(passwordView.frame), 170, 30)];
    
    Label1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    Label2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    nameView.text = @"用户名:";
    passwordView.text = @"密码:";
    Label1.placeholder = @"请输入用户名";
    Label2.placeholder = @"请输入密码";
    
    Label1.borderStyle = UITextBorderStyleRoundedRect;
    Label2.borderStyle = UITextBorderStyleRoundedRect;
    Label1.clearButtonMode = YES;
    Label2.clearButtonMode = YES;
    Label2.secureTextEntry = YES;
    
    
    [self.view addSubview:nameView];
    [self.view addSubview:passwordView];
    [self.view addSubview:Label1];
    [self.view addSubview:Label2];
    
    
     UILabel *repasswordView = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(passwordView.frame), CGRectGetMaxY(passwordView.frame) + 20, CGRectGetWidth(nameView.frame), CGRectGetHeight(nameView.frame))];
    UITextField *Label3 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(repasswordView.frame) + 20, CGRectGetMinY(repasswordView.frame) , CGRectGetWidth(Label1.frame), CGRectGetHeight(Label1.frame))];
    
    Label3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    repasswordView.text = @"确认密码:";
    Label3.placeholder = @"再次输入密码";
    
    Label3.borderStyle = UITextBorderStyleRoundedRect;
    Label3.clearButtonMode = YES;
    Label3.secureTextEntry = YES;
    
    [self.view addSubview:repasswordView];
    [self.view addSubview:Label3];
    
    
    UILabel *EmailView = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(repasswordView.frame), CGRectGetMaxY(repasswordView.frame) + 20, CGRectGetWidth(nameView.frame), CGRectGetHeight(nameView.frame))];
    UITextField *Label4 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(EmailView.frame) + 20, CGRectGetMinY(EmailView.frame) , CGRectGetWidth(Label1.frame), CGRectGetHeight(Label1.frame))];
    
    Label4.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    EmailView.text = @"邮箱:";
    Label4.placeholder = @"请输入邮箱";
    
    Label4.borderStyle = UITextBorderStyleRoundedRect;
    Label4.clearButtonMode = YES;
    
    [self.view addSubview:EmailView];
    [self.view addSubview:Label4];
    
    
    UILabel *phoneView = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(EmailView.frame), CGRectGetMaxY(EmailView.frame) + 20, CGRectGetWidth(nameView.frame), CGRectGetHeight(nameView.frame))];
    UITextField *Label5 = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneView.frame) + 20, CGRectGetMinY(phoneView.frame) , CGRectGetWidth(Label1.frame), CGRectGetHeight(Label1.frame))];
    
    Label5.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    phoneView.text = @"联系方式:";
    Label5.placeholder = @"请输入练习方式";
    
    Label5.borderStyle = UITextBorderStyleRoundedRect;
    Label5.clearButtonMode = YES;
    
    [self.view addSubview:phoneView];
    [self.view addSubview:Label5];
    
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
