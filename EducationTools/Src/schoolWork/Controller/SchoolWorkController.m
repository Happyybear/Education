//
//  SchoolWorkController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "SchoolWorkController.h"
#import "SchoolWorkCell.h"
#import "ClassViewController.h"
#import "AppDelegate.h"
#import "ClassModel.h"
#import "DXAlertView.h"
@interface SchoolWorkController ()

@end

@implementation SchoolWorkController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    [self configMJ];
    [self.mTableView.mj_header beginRefreshing];
//    [self.mTableView reloadData];
}
#pragma mark - **************** dataLoad
- (void)configMJ{
    @WeakObj(self);
    self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [selfWeak loadData];
    }];
}

- (void)loadData{
    
    AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSMutableDictionary * dict = [NSMutableDictionary new];
    
    if (app.type == 0) {//主管理
        [dict setObject:self.school_id forKey:@"schoolid"];
    }
    [dict setObject:@1 forKey:@"mode"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:QClass jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        [self.mTableView.mj_header endRefreshing];
        if ([[response objectForKey:@"result"]intValue] == 0 ) {
            [selfWeak dealData:response[@"jsondata"]];
            [selfWeak.mTableView reloadData];
        }else{
            
        }
    } failBlock:^(NSError *error) {
        
    }];
}

- (void)dealData:(id)response{
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    NSArray * runArr = [response objectForKey:@"class"];
    NSDictionary * noRUndict = [response objectForKey:@"unclass"];
    
    ClassModel * model = [[ClassModel alloc]init];
    model.isRun = NO;
    model.studentcount = noRUndict[@"studentcount"];
    [self.dataSource addObject:model];
    
    for (NSDictionary * dict in runArr) {
        ClassModel * model = [ClassModel yy_modelWithJSON:dict];
        model.isRun = YES;
        [self.dataSource addObject:model];
    }

}
#pragma mark - **************** UI
- (void)configView{
    self.title = @"班级管理";
}
#pragma mark - **************** action
- (void)manage:(NSString *)class_id{
    ClassViewController * classV = [[ClassViewController alloc] init];
    classV.class_id = class_id;
    classV.allclassData = self.dataSource;
    [self.navigationController pushViewController:classV animated:YES];
}

- (void)endClass:(NSString *)clss_id{
    @WeakObj(self);
    DXAlertView* alert = [[DXAlertView alloc] initWithTitle:@"提示" contentText:@"结束该课程" leftButtonTitle:@"确定" rightButtonTitle:@"取消"];
    alert.leftBlock = ^{
        [selfWeak dealData:clss_id];
    };
    [alert show];
    
//
//    UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"取消该班级" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction * dis = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//    [alter addAction:dis];
//
//    @WeakObj(self);
//    UIAlertAction * ture = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
//        //                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/cn/app/sem能效管理-国内顶尖能效管家/id1165972740?mt=8"]];
//        [selfWeak dealData:clss_id];
//
//    }];
//    [alter addAction:ture];
}
//删除班级
- (void)delete:(NSString *)clss_id{
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:clss_id forKey:@"id"];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:DClass jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
    } failBlock:^(NSError *error) {
        
    }];
}
#pragma mark - **************** delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"schoolWork";
    SchoolWorkCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SchoolWorkCell" owner:self options:0]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell refreshUI:self.dataSource[indexPath.row]];
    @WeakObj(self);
    cell.cellClick = ^(int type) {
        if (type == 0) {
           //管理
            ClassModel * model = selfWeak.dataSource[indexPath.row];
            [selfWeak manage:model.class_id];
        }else{
            //结课
            ClassModel * model = selfWeak.dataSource[indexPath.row];
            [selfWeak endClass:model.class_id];
        }
    };
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
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
