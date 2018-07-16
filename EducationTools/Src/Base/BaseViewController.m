//
//  BaseViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/4/27.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRootNav];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createRootNav
{
    self.navigationController.navigationBar.translucent = NO;
    //    self.navigationController.navigationBar.barTintColor = RGBA(255, 156, 187, 1);
    self.navigationController.navigationBar.barTintColor = RGB(66,83,98);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    UIOffset offset = [UIDevice currentDevice].systemVersion.floatValue >= 11.0 ? UIOffsetMake(-200, 0) : UIOffsetMake(0, -80);
//    //左按钮
//    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.leftButton.frame = CGRectMake(0, 0, 44, 44);
//    self.leftButton.imageView.contentMode = 0;
//    //[self.leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
//    UIBarButtonItem *left_Item = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
//    UIBarButtonItem * left_navagative = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    left_navagative.width = BUTTON_OFFSET;
//    self.navigationItem.leftBarButtonItems = @[left_navagative,left_Item];
//
//    //标题
//    self.titleLabel = [[UILabel alloc]init];
//    self.titleLabel.frame = CGRectMake(0, 0, 100, 25);
//    self.titleLabel.textColor = [UIColor whiteColor];
//    self.titleLabel.font = [UIFont systemFontOfSize:20];
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.navigationItem.titleView = self.titleLabel;
//
//    //右按钮
//    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.rightButton.frame = CGRectMake(0, 0, 44, 44);
//    self.rightButton.imageView.contentMode = 0;
//    //    UIBarButtonItem *right_Item = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
//    self.itemRight = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
//    self.navigationItem.rightBarButtonItems = @[left_navagative,self.itemRight];
//
    
    //    [self.navigationController.interactivePopGestureRecognizer addTarget:self action:@selector(handleGesture:)];
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
