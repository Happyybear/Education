//
//  RegisterViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "RegisterViewController.h"
#import "NameCell.h"
#import "PhoneCell.h"
#import "BrirthdayCell.h"
#import "CheakCodeCell.h"
#import "NormalNameCell.h"
#import "HomePageViewController.h"
#import "JobCell.h"
#import "AreaCell.h"
#import "RegisterModel.h"
#define dataCount 7
@interface RegisterViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * mTableView;

@property (nonatomic,strong) NSMutableArray * dataSource;

@property (nonatomic,strong) NSMutableArray * content_data;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    
    [self configData];
}

- (void)configData{
    for (int i = 0; i<dataCount; i++) {
        ContentModel * model = [[ContentModel alloc] init];
        [self.content_data addObject:model];
    }
}

- (void)initView{
    self.title = @"注册";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
    _mTableView.dataSource = self;
    _mTableView.delegate = self;
    _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_mTableView];
    
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
#pragma mark - **************** delegate --tableview
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ContentModel * model = self.content_data[indexPath.row];
    switch (indexPath.row) {
        case 0:{//name
            static NSString *cellDentifier = @"cell1";
            NameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
            if (!cell) {
                cell = [[NameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
            }
            [cell setCellWith:model];
            return cell;
        }
            
            break;
        case 1:{//出生日期
            static NSString *cellDentifier = @"cell2";
            BrirthdayCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
            if (!cell) {
                cell = [[BrirthdayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
                cell.mcontrol = self;
            }
             [cell setCellWith:model];
            return cell;
        }
            
            break;
        case 2:{//phone
            static NSString *cellDentifier = @"cell2";
            PhoneCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
            if (!cell) {
                cell = [[PhoneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
            }
             [cell setCellWith:model];
            return cell;
        }
        case 3:{//验证码
            static NSString *cellDentifier = @"cell3";
            NormalNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
            if (!cell) {
                cell = [[NormalNameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
            }
            [cell setCellWith:model];
            cell.name.text = @"验证码:";
            return cell;
        }
            break;
        case 4:{//职位
            static NSString *cellDentifier = @"cell3";
            JobCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
            if (!cell) {
                cell = [[JobCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
            }
             [cell setCellWith:model];
            cell.name.text = @"职位:";
            return cell;
        }
            
            break;
        case 5:{//校区
            static NSString *cellDentifier = @"cell4";
            AreaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
            if (!cell) {
                cell = [[AreaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
            }
            [cell setCellWith:model];
            cell.name.text = @"校区:";
            return cell;
        }
            
            break;
        case 6:{//密码
            static NSString *cellDentifier = @"cell4";
            NormalNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
            if (!cell) {
                cell = [[NormalNameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
            }
            [cell setCellWith:model];
            cell.name.text = @"密码：";
            return cell;
            }
            break;
        case 7:{//密码
            
        }
            
            break;
            
        default:
            break;
    }
    static NSString *cellDentifier = @"cell";
    NameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
    if (!cell) {
        cell = [[NameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
    }
    
    //设置timeLabel字体大小
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    bg.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((SCREEN_W-200)/2, 40, 200, 44);
    
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    
    [bg addSubview:btn];
    
    return bg;
}

- (void)commit{
    
    ContentModel * model1 = [self.content_data firstObject];
    ContentModel * model2 = self.content_data[1];
    ContentModel * model3 = self.content_data[2];
    ContentModel * model4 = self.content_data[3];
    ContentModel * model5 = self.content_data[4];
    ContentModel * model6 = self.content_data[5];
    ContentModel * model7 = self.content_data[6];
//    ContentModel * model8 = self.content_data[7];

    RegisterModel * m = [[RegisterModel alloc] initWith:model1.value1 sex:[model1.value2 intValue] birthdate:model2.value1 school:model6.value1 phone:model3.value1 type:[model5.value1 intValue] authcode:model4.value1 pwd:model7.value1];
    
    NSDictionary * dict = [m yy_modelToJSONObject];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:Register jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        if ([response objectForKey:@"result"] == 0) {
            //获取验证码成功
        }else{
            
        }
    } failBlock:^(NSError *error) {
        
    }];
//    HomePageViewController *home = [[HomePageViewController alloc] init];
//    [self.navigationController pushViewController:home animated:YES];
}

#pragma mark - **************** set\get
- (NSMutableArray*)content_data{
    if (!_content_data) {
        _content_data = [[NSMutableArray alloc] init];
    }
    return _content_data;
}

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

@end
