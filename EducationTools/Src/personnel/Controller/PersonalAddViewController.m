//
//  PersonalAddViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PersonalAddViewController.h"

#import "NameAndSex.h"
//#import "TwoTextField.h"
//#import "OneTextfiled.h"
//#import "BrithView.h"
//#import "PayNumView.h"
//#import "PayMethodView.h"
//#import "PayPursh.h"
//#import "PhotoSeletorModel.h"
//#import "RemarkView.h"
//#import "CommitView.h"
#import "OneTextfiled.h"
#import "PickerViewModle.h"
#import "TwoTextField.h"
#import "TeacherInfoModel.h"
#import "PayrollViewController.h"
#define item_height 50
@interface PersonalAddViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSMutableArray * dataSource;

@property (nonatomic,strong) UIScrollView *scroller;

@property (nonatomic,strong) NameAndSex *Name;
@property (nonatomic,strong) PickerViewModle *brithDate;
@property (nonatomic,strong) PickerViewModle *jobDate;
@property (nonatomic,strong) PickerViewModle *school;
@property (nonatomic,strong) PickerViewModle *classInfo;
@property (nonatomic,strong) OneTextfiled *minSalary;
@property (nonatomic,strong) OneTextfiled *reword;
@property (nonatomic,strong) OneTextfiled *useSalary;
@property (nonatomic,strong)  TwoTextField *user;
@property (nonatomic,strong) OneTextfiled *personNum;
@property (nonatomic,strong) UIView *commit;

@property (nonatomic,strong) TeacherInfoModel * info;
@end

@implementation PersonalAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self addView];
    [self loadData];
}

-(void)initView{
    
    self.title = @"员工管理";
    self.scroller = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scroller.delegate = self;
    self.scroller.contentOffset = CGPointMake(0, 0);
    self.scroller.bounces = YES;
    self.scroller.showsHorizontalScrollIndicator =NO;
    self.scroller.showsVerticalScrollIndicator = NO;
    self.scroller.userInteractionEnabled = YES;
    self.scroller.backgroundColor = RGB(235, 235, 244);
    [self.view addSubview:self.scroller];
    
}

- (void)loadData{
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setValue:@2 forKey:@"mode"];
    [dict setValue:self.m_Id forKey:@"id"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:QEmployees jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        switch ([[response objectForKey:@"result"]intValue]) {
            case 0:{
                NSDictionary * dict = [response objectForKey:@"jsondata"];
                self.info = [TeacherInfoModel yy_modelWithDictionary:dict];
                [self refreshUI];
            }
                break;
                
            default:
                break;
        }
    } failBlock:^(NSError *error) {
        
    }];
}

/**
 跟新UI
 */
- (void)refreshUI{
    self.Name.nameTF.text = self.info.name;
    if (self.info.sex == 0) {
        self.Name.women.selected = YES;
    }else{
        self.Name.men.selected = YES;
    }
    self.brithDate.nameTF1.text = self.info.birthdate;
//    self.jobDate.nameTF1.text = self.info.
    self.school.nameTF1.text = self.info.school;
    self.classInfo.nameTF1.text = self.info.t_class;
    self.minSalary.nameTF1.text  = self.info.salarybase;
    self.reword.nameTF1.text = self.info.disclassbonus;
    self.user.nameTF1.text = self.info.phone;
    self.user.nameTF2.text = self.info.pwd;
    self.useSalary.nameTF1.text = self.info.workagebonus;
}

- (void)addView{
    
    UIView * bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREEN_W, (item_height+10)*11)];
    bgView.backgroundColor = RGB(235, 235, 244);
    bgView.userInteractionEnabled = YES;
    [self.scroller addSubview:bgView];
    
    self.Name = [[NameAndSex alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.Name configUISetWithName:@"教师姓名:" textfiled:nil Name2:@"性别" Button:@"男" Button:@"女"];
    
    
    self.brithDate = [[PickerViewModle alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.brithDate configUISetWithName:@"出生日期:" inputType:dateSelector];
    
    self.jobDate = [[PickerViewModle alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.jobDate configUISetWithName:@"任职日期:" inputType:dateSelector];
    
    self.school = [[PickerViewModle alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.school configUISetWithName:@"毕业院校:" inputType:schoolSelector];
    
    self.classInfo = [[PickerViewModle alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W,item_height)];
    [self.classInfo configUISetWithName:@"授课班级:" inputType:schoolSelector];
    
    self.minSalary = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    
    [self.minSalary configUISetWithName:@"工资底薪:" inputType:UIKeyboardTypeNumberPad];
    
    self.reword = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.reword configUISetWithName:@"工龄奖励:" inputType:UIKeyboardTypeNumberPad];
    
    self.useSalary = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.useSalary configUISetWithName:@"课消薪资:" inputType:UIKeyboardTypeNumberPad];
    
    self.user = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.user configUISetWithName:@"账号:" Name2:@"密码:"];
    
    [bgView addSubview:self.Name];
    [bgView addSubview:self.brithDate];
    [bgView addSubview:self.jobDate];
    [bgView addSubview:self.school];
    [bgView addSubview:self.classInfo];
    [bgView addSubview:self.minSalary];
    [bgView addSubview:self.reword];
    [bgView addSubview:self.useSalary];
    [bgView addSubview:self.user];

    
    __weak typeof(self) weakSelf = self;
    [self.Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(bgView.mas_top);
    }];
    
    [self.brithDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.Name.mas_bottom).offset(10);
    }];
    
    [self.jobDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.brithDate.mas_bottom).offset(10);
    }];
    
    [self.school mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.jobDate.mas_bottom).offset(10);
    }];
    
    [self.classInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.school.mas_bottom).offset(10);
    }];
    
    [self.minSalary mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.classInfo.mas_bottom).offset(10);
    }];
    
    [self.reword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.minSalary.mas_bottom).offset(10);
    }];
    [self.useSalary mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.reword.mas_bottom).offset(10);
    }];
    
    [self.user mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.useSalary.mas_bottom).offset(10);
    }];
    
    //添加Button
    UIButton *change = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *set = [UIButton buttonWithType:UIButtonTypeCustom];
    change.frame = CGRectMake(0, 0, 80, 40);
    set.frame = CGRectMake(0, 0, 80, 40);
    change.backgroundColor = RGB(1, 189, 242);;
    set.backgroundColor = RGB(1, 189, 242);
    change.layer.cornerRadius = 5;
    set.layer.cornerRadius =5;
    [change setTitle:@"修改信息" forState:UIControlStateNormal];
    [set setTitle:@"工资发放" forState:UIControlStateNormal];
    
    [change addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [set addTarget:self action:@selector(set) forControlEvents:UIControlEventTouchUpInside];
    
    [bgView addSubview:change];
    [bgView addSubview:set];
    
    [change mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(60);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(weakSelf.user.mas_bottom).offset(10);
    }];
    
    [set mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-60);
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(weakSelf.user.mas_bottom).offset(10);
    }];
    
    
    [self.scroller layoutIfNeeded];
    
    bgView.frame = CGRectMake(0, 0, SCREEN_W, CGRectGetMaxY(change.frame)+10);
    self.scroller.contentSize = CGSizeMake(self.view.bounds.size.width,CGRectGetMaxY(change.frame)+70);
}

- (void)change{
    if (!self.Name.nameTF.text || !self.brithDate ||!self.jobDate || !self.school||!self.classInfo||!self.minSalary||!self.reword ||!self.useSalary||!self.user||!self.personNum ) {
        
    }else{
        TeacherInfoModel *inf = [[TeacherInfoModel alloc] init];
        inf.name = self.Name.nameTF.text;
        inf.sex = self.Name.women.selected ?0:1;
        inf.school = self.school.nameTF1.text;
        inf.salarybase = self.minSalary.nameTF1.text;
        inf.disclassbonus = self.reword.nameTF1.text;
        inf.phone = self.user.nameTF1.text;
        inf.workagebonus = self.useSalary.nameTF1.text;
        inf.pwd = self.user.nameTF2.text;
        inf.t_class = self.classInfo.nameTF1.text;
        inf.birthdate = self.brithDate.nameTF1.text;
        inf.disclassbonus = self.useSalary.nameTF1.text;
    }
    TeacherInfoModel *inf = [[TeacherInfoModel alloc] init];
    inf.name = self.Name.nameTF.text;
    inf.sex = self.Name.women.selected ?0:1;
    inf.school = self.school.nameTF1.text;
    inf.salarybase = self.minSalary.nameTF1.text;
    inf.disclassbonus = self.reword.nameTF1.text;
    inf.phone = self.user.nameTF1.text;
    inf.workagebonus = self.useSalary.nameTF1.text;
    inf.pwd = self.user.nameTF2.text;
    inf.t_class = self.classInfo.nameTF1.text;
    inf.birthdate = self.brithDate.nameTF1.text;
    inf.disclassbonus = self.useSalary.nameTF1.text;
    NSDictionary * value = [inf yy_modelToJSONObject];
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:value forKey:@"fields"];
    [dict setObject:self.m_Id forKey:@"id"];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:ChangeEmployees jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
    } failBlock:^(NSError *error) {
        
    }];
}
//工资发放
- (void)set{
    PayrollViewController * par = [[PayrollViewController alloc] init];
    [self.navigationController pushViewController:par animated:YES];
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
