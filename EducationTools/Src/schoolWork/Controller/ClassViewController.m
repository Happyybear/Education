//
//  ClassViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ClassViewController.h"
#import "MemberManageCell.h"
#import "RebackMoneyController.h"
#import "ClassInfoModel.h"
#import "MemberDetailViewController.h"
@interface ClassViewController ()

@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    [self configMJ];
    [self.mTableView.mj_header beginRefreshing];
}
- (void)configView{
    self.title = @"会员管理";
}
#pragma mark - **************** loadData
- (void)configMJ{
    @WeakObj(self);
    self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [selfWeak loadData];
    }];
}

- (void)loadData{
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:@4 forKey:@"mode"];
    [dict setObject:self.class_id forKey:@"classid"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:QStudent jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
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

//处理数据
- (void)dealData:(id)data{
    self.dataSource = [NSMutableArray new];
    for (NSDictionary * dict in data) {
        ClassInfoModel *model = [ClassInfoModel yy_modelWithJSON:dict];
        [self.dataSource addObject:model];
    }
}
#pragma mark - **************** delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 68;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"schoolWork";
    MemberManageCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MemberManageCell" owner:self options:0]lastObject];
        //        cell.delegate = self;
    }
    
    ClassInfoModel * model = self.dataSource[indexPath.row];
    
    [cell refreshUI:model];
    
    @WeakObj(self);
    cell.cellClick = ^(int type,NSString * s_id) {
        switch (type) {
            case 0:{//查看学生
                MemberDetailViewController * mem = [[MemberDetailViewController alloc] init];
                mem.student_id = s_id;
                mem.allclassData = selfWeak.allclassData;
                [self.navigationController pushViewController:mem animated:YES];
            }
                break;
            case 1:{//已到期
                
            }
                break;
            case 2:{//已颓废
                RebackMoneyController * reback = [[RebackMoneyController alloc] init];
                [self.navigationController pushViewController:reback animated:YES];
            }
                break;
            case 3:{
                
            }
                break;
                
            default:
                break;
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
