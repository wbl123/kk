//
//  LoginViewController.m
//  UI-豆瓣网
//
//  Created by lanou3g on 15/9/21.
//  Copyright (c) 2015年 zhangkayi. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"用户登录";
    
 //   self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarAction:)];
    
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarAction:)];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
    [self p_layout];
    
}

-(void)p_layout{
    
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
    
    UIButton *login = [UIButton buttonWithType:(UIButtonTypeSystem)];
    UIButton *register1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    login.frame = CGRectMake(CGRectGetMinX(nameView.frame), CGRectGetMaxY(passwordView.frame) + 20, 120, 40);
    register1.frame = CGRectMake(CGRectGetMaxX(login.frame) + 30, CGRectGetMinY(login.frame), CGRectGetWidth(login.frame), CGRectGetHeight(login.frame));
    
    [login setTitle:@"登录" forState:UIControlStateNormal];
    [register1 setTitle:@"注册" forState:UIControlStateNormal];
    
    [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [register1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    login.backgroundColor = [UIColor colorWithRed:0.7 green:0.78 blue:0.3 alpha:1.0];
    register1.backgroundColor = [UIColor orangeColor];
    
    [login.layer setMasksToBounds:YES];
    [login.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    [login.layer setBorderWidth:0.5]; //边框宽度
  
    [register1.layer setMasksToBounds:YES];
    [register1.layer setCornerRadius:5.0];
    [register1.layer setBorderWidth:0.5];
    
    [self.view addSubview:login];
    [self.view addSubview:register1];
    
    [login addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [register1 addTarget:self action:@selector(register1Action:) forControlEvents:UIControlEventTouchUpInside];
}

///  登陆按键
-(void)loginAction:(UIButton *)sender{
    
}

//  注册按键
-(void)register1Action:(UIButton *)sender{
    /////  模态
    RegisterViewController * registerVC = [[RegisterViewController alloc] init];
    UINavigationController * registerNC = [[UINavigationController alloc] initWithRootViewController:registerVC];
    
     [self presentViewController:registerNC animated:YES completion:nil];
}


//  左按键
-(void)leftBarAction:(UIBarButtonItem *)sender{
    ///////   模态  隐藏
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    
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
