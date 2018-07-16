//
//  DataStaticsViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/14.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "DataStaticsViewController.h"
#import "CharView.h"
@interface DataStaticsViewController ()

@end

@implementation DataStaticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}

- (void)configView{
    NSMutableArray * data = [[NSMutableArray alloc] init];
    [data addObject:@"1"];
    [data addObject:@"1"];
    
    CharView *charView = [[CharView alloc] initWithFrame:CGRectMake(0, 68, 375, 400) chartStyle:LineChart];
    [charView darwStartWith:data];
    [self.view addSubview:charView];
    self.view.backgroundColor = [UIColor whiteColor];
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
