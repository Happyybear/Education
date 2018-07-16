//
//  AttenceViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/5.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "AttenceViewController.h"
#import "AttenceCell.h"
@interface AttenceViewController ()
@end

@implementation AttenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configMJ];
    [self configView];
    [self loadData];
}

- (void)configMJ{
    self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
}

- (void)loadData{
    [self.dataSource addObject:@"1"];
}
- (void)configView{
    self.title = @"学员考勤";
    self.view.backgroundColor = [UIColor whiteColor];
    self.mTableView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - HYStatusBarHeight-64);
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView * commitView = [[UIView alloc]initWithFrame:kRect(0, CGRectGetMaxY(self.mTableView.frame), SCREEN_W, 64)];
    commitView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:commitView];
    
    NSMutableArray * buttonArr = [self getButton:commitView];
    
    [buttonArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:40 tailSpacing:40];
    
    [buttonArr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(commitView.mas_top).with.offset(0);
        
        make.height.equalTo(@25);
    }];
}

- (NSMutableArray *)getButton:(UIView *)view{
    
    NSMutableArray * buttonArr = [[NSMutableArray alloc] init];
    
    NSArray * titlte = @[@"全选",@"考勤",@"结课"];
    NSArray * colorArr = @[RGB(241, 181, 43),RGB(42, 191, 240),RGB(239, 91, 40)];
    for (int i = 0; i<3; i++) {
        UIButton * button = [FactoryUI createButtonWithFrame:kRect(0, 0, 0, 0) title:titlte[i] titleColor:[UIColor whiteColor] imageName:nil backgroundImageName:nil target:self selector:@selector(handler:)];
        [button setBackgroundColor:colorArr[i]];
        button.layer.cornerRadius = 5.0f;
        button.tag = 1000+i;
        [buttonArr addObject:button];
        [view addSubview:button];
    }
    return buttonArr;
}


#pragma mark - **************** delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"schoolWork";
    AttenceCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell  = [[[NSBundle mainBundle] loadNibNamed:@"AttenceCell" owner:self options:0]lastObject];
    }
    //点击考勤
    @WeakObj(self);
//    cell.attenceDeAction = ^{
//
//    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
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
