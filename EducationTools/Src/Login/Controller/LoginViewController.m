//
//  LoginViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/4/27.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomePageViewController.h"
#import "AppDelegate.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubView];
    
    [self configUI];
    // Do any additional setup after loading the view from its nib.
}

- (void)configUI{
    self.nameText.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"name"]:nil;
    self.passwordText.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"passWord"]?[[NSUserDefaults standardUserDefaults] objectForKey:@"passWord"]:nil;
    self.login.layer.borderWidth = 2;
    self.login.layer.borderColor = [UIColor whiteColor].CGColor;
    self.login.backgroundColor = RGB(33, 190, 240);
    
    self.registBtn.layer.borderWidth = 2;
    self.registBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registBtn.backgroundColor = RGB(33, 190, 240);
}

- (void)addSubView{
    
    self.bgView.backgroundColor = [UIColor clearColor];
    
    self.headView.layer.cornerRadius = self.headView.frame.size.width/2;
    
    self.login.layer.cornerRadius = 8;
    self.registBtn.layer.cornerRadius = 8;
    
    [self.login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.registBtn addTarget:self action:@selector(regist:) forControlEvents:UIControlEventTouchUpInside];
//    [self.login addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)login:(UIButton *)btn{

    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setValue:self.nameText.text forKey:@"phone"];
    [dict setValue:self.passwordText.text forKey:@"pwd"];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:Login jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        if ([[response objectForKey:@"result"]intValue] == 0) {
            //获取验证码成功
//            [MBProgressHUD showSuccess:@"登录成功"];
            NSDictionary *dict = [response objectForKey:@"jsondata"];
            
            AppDelegate * app =(AppDelegate *)[UIApplication sharedApplication].delegate;
            app.p_id = dict[@"id"];
            app.token = dict[@"token"];
            app.type = [dict[@"type"] intValue];
            
            [[NSUserDefaults standardUserDefaults] setObject:self.nameText.text forKey:@"name"];
            [[NSUserDefaults standardUserDefaults] setObject:self.passwordText.text forKey:@"passWord"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            HomePageViewController * home = [[HomePageViewController alloc] init];
            UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:home];
            [self presentViewController:nvc animated:YES completion:^{
                
            }];
        }else{
            
        }
    } failBlock:^(NSError *error) {
        
    }];

}

- (void)regist:(UIButton *)btn{
    
    RegisterViewController * vc = [[RegisterViewController alloc] init];
    
    UINavigationController * nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nvc animated:YES completion:^{
        
    }];
    //    self.loginBlock();
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
