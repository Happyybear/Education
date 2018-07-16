//
//  PersonViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonalCell.h"
#import "PersonalAddViewController.h"
#import "PersonModel.h"
@interface PersonViewController ()<cellClick>

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    
//    self.mTableView.
    [self.mTableView reloadData];
    [self loadData];
}


/**
 加载数据
 */
- (void)loadData{
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@1 forKey:@"mode"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:QEmployees jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        self.dataSource = [NSMutableArray new];
        if ([[response objectForKey:@"result"] intValue] == 0) {
            NSArray * arr = [response objectForKey:@"jsondata"];
            for (NSDictionary * dict in arr) {
                PersonModel *peronModel = [PersonModel yy_modelWithDictionary:dict];
                [self.dataSource addObject:peronModel];
            }
        }
        [self.mTableView reloadData];
    } failBlock:^(NSError *error) {
        
    }];
}
/**
 UI
 */
- (void)configUI{
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark - **************** delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellP";
    PersonalCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PersonalCell" owner:self options:0]lastObject];
        cell.delegate = self;
    }
    [cell setCell:self.dataSource[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    bg.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((SCREEN_W-200)/2, 10, 200, 44);
    
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"添加员工" forState:UIControlStateNormal];
    btn.backgroundColor = RGB(1, 189, 242);
    [btn addTarget:self action:@selector(addPerson) forControlEvents:UIControlEventTouchUpInside];
    
    [bg addSubview:btn];
    
    return bg;
}

- (void)mangeClick:(NSString *)m_id{
    PersonalAddViewController * pv = [[PersonalAddViewController alloc] init];
    pv.m_Id = m_id;
    [self.navigationController pushViewController:pv animated:YES];
}

- (void)deleteClick:(NSString *)m_id{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setObject:m_id forKey:@"id"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:DEmployees jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        DLog(@"%@",response);
        [self loadData];
    } failBlock:^(NSError *error) {
        
    }];
}
//添加员工
- (void)addPerson{
    PersonalAddViewController * pv = [[PersonalAddViewController alloc] init];
    [self.navigationController pushViewController:pv animated:YES];
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
