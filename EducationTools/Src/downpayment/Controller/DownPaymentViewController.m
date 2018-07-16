//
//  DownPaymentViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/11.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "DownPaymentViewController.h"
#import "DownPayMentCell.h"
@interface DownPaymentViewController ()

@end

@implementation DownPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.dataSource addObject:@"1"];
    [self.dataSource addObject:@"1"];
    [self configMJ];
    [self configView];
    [self.mTableView.mj_header beginRefreshing];
}

- (void)configMJ{
    self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
}

- (void)loadData{
    
}
- (void)configView{
    self.title = @"定金管理";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellPay";
    DownPayMentCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"DownPayMentCell" owner:self options:0]lastObject];
//        cell.delegate = self;
    }
//    [cell setCell:self.dataSource[indexPath.row]];
    return cell;

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
