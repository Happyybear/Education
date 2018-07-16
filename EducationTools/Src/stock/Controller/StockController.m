//
//  StockController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "StockController.h"
#import "StockCell.h"
#import "GoodsModel.h"
@interface StockController ()

@end

@implementation StockController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    [self configMJ];
//    [self.dataSource  addObject:@"1"];
    [self.mTableView.mj_header beginRefreshing];
}
- (void)configView{
    self.title = @"校务管理";
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    [dict setObject:@1 forKey:@"mode"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:QGoods jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
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
    for (NSDictionary * dict in (NSArray *)response) {
        GoodsModel * model = [GoodsModel yy_modelWithJSON:dict];
        [self.dataSource addObject:model];
    }
    
}
#pragma mark - **************** action
- (void)sendData:(NSString *)purpose count:(int)count mid:(NSString *)m_di{
    NSMutableDictionary * dict = [NSMutableDictionary new];
    
    NSMutableDictionary * subDict = [NSMutableDictionary new];
    [subDict setObject:[NSNumber numberWithInt:count] forKey:@"count"];
    [subDict setObject:[NSNumber numberWithInt:count] forKey:@"cost"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    [dict setObject:subDict forKey:@"fields"];
    [dict setObject:m_di forKey:@"id"];
    @WeakObj(self);
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:ChangeGoods jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        [self.mTableView.mj_header endRefreshing];
        if ([[response objectForKey:@"result"]intValue] == 0 ) {
            [selfWeak dealData:response[@"jsondata"]];
           
        }else{
            
        }
        
    } failBlock:^(NSError *error) {
        
    }];

}
#pragma mark - **************** delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"schoolWork";
    StockCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"StockCell" owner:self options:0]lastObject];
    }
    
    GoodsModel * good = self.dataSource[indexPath.row];
    [cell refreshUI:good];
    
    @WeakObj(self);
    cell.stock = ^(NSString *purpose, int count) {
        [selfWeak sendData:purpose count:count mid:good.good_id];
    };
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
//    bg.backgroundColor = [UIColor whiteColor];
//    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake((SCREEN_W-200)/2, 40, 200, 44);
//    
//    btn.layer.cornerRadius = 5;
//    [btn setTitle:@"提交" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blueColor];
//    [btn addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
//    
//    [bg addSubview:btn];
//    
//    return bg;
//}
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
