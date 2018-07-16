//
//  PeportFormViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/15.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PeportFormViewController.h"
#import "m_PieChartView.h"
@interface PeportFormViewController ()

@end

@implementation PeportFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    // Do any additional setup after loading the view.
}

- (void)configView{
    self.view.backgroundColor = [UIColor whiteColor];
    m_PieChartView *pie = [[m_PieChartView alloc] initWithFrame:CGRectMake(0, 64, 375, 400)];
    [self.view addSubview:pie];
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
