//
//  ManageSchoolController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/9.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ManageSchoolController.h"
#import "ManageSchoolCell.h"
#import "ManageSchoolModel.h"
#import "ManageClassController.h"
@interface ManageSchoolController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ManageSchoolController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configView];
    
    [self configMJ];
    
    [self.mTableView.mj_header beginRefreshing];
    //    [self.mTableView reloadData];
}


- (void)configView{
    
    self.title = @"校区管理";
    
}

- (void)pullInClassManage:(NSString *)p_id{
    ManageClassController * claaVC = [[ManageClassController alloc] init];
    claaVC.school_id = p_id;
    [self.navigationController pushViewController:claaVC animated:YES];
}
#pragma mark - **************** data
#pragma mark - **************** dataLoad
- (void)configMJ{
    @WeakObj(self);
    self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [selfWeak loadData];
    }];
}
//加载数据
- (void)loadData{
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:@3 forKey:@"mode"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:QSchool jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        [selfWeak.mTableView.mj_header endRefreshing];
        if ([response objectForKey:@"result"]) {
            [selfWeak dealData:response[@"jsondata"]];
            [selfWeak.mTableView reloadData];
        }
        NSLog(@"%@",response);
    } failBlock:^(NSError *error) {
        
    }];
}

- (void)dealData:(id)response{
    
    self.dataSource = [[NSMutableArray alloc] init];
    
    for (NSDictionary * dict in (NSArray *)response) {
        ManageSchoolModel * model = [ManageSchoolModel yy_modelWithJSON:dict];
        [self.dataSource addObject:model];
    }
}
#pragma mark - **************** delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"schoolWork";
    ManageSchoolCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ManageSchoolCell" owner:self options:0]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    ManageSchoolModel * model = self.dataSource[indexPath.row];
    [cell refreshUI:model];
    @WeakObj(self);
    cell.cellClick = ^(NSString *p_id) {
        [selfWeak pullInClassManage:p_id];
    };
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
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
