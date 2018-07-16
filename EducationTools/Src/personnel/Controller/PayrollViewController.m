
//
//  PayrollViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/1.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PayrollViewController.h"
#import "OneTextfiled.h"
#import "PickerViewModle.h"
#import "TwoTextField.h"
#import "TeacherInfoModel.h"
#import "NameAndSex.h"
#import "Reword.h"
#import "CommitView.h"
#define item_height 50
@interface PayrollViewController ()

@property (nonatomic,strong) NSMutableArray * dataSource;

@property (nonatomic,strong) UIScrollView *scroller;

@property (nonatomic,strong) TwoTextField *Name;
@property (nonatomic,strong) TwoTextField *salary;
@property (nonatomic,strong) OneTextfiled *class_salary;
@property (nonatomic,strong) Reword *reword;
@property (nonatomic,strong) PickerViewModle *classInfo;
@property (nonatomic,strong) TwoTextField *rebackfee;
@property (nonatomic,strong) TwoTextField *presonl;
@property (nonatomic,strong) OneTextfiled *oneToClass;
@property (nonatomic,strong)  OneTextfiled *allSalary;
@property (nonatomic,strong) CommitView * commitView;
@property (nonatomic,strong) TeacherInfoModel * info;

@end

@implementation PayrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
    [self addView];
    [self loadData];
}

-(void)initView{
    
    self.title = @"工资发放";
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
//
//    NSMutableDictionary * dict = [NSMutableDictionary new];
//    [dict setValue:@2 forKey:@"mode"];
//    [dict setValue:self.m_Id forKey:@"id"];
//    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
//
//    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:QEmployees jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
//
//    } successBlock:^(id response) {
//        NSLog(@"%@",response);
//        switch ([[response objectForKey:@"result"]intValue]) {
//            case 0:{
//                NSDictionary * dict = [response objectForKey:@"jsondata"];
//                self.info = [TeacherInfoModel yy_modelWithDictionary:dict];
//                [self refreshUI];
//            }
//                break;
//
//            default:
//                break;
//        }
//    } failBlock:^(NSError *error) {
//
//    }];
}

/**
 跟新UI
 */
//- (void)refreshUI{
//    self.Name.nameTF.text = self.info.name;
//    if (self.info.sex == 0) {
//        self.Name.women.selected = YES;
//    }else{
//        self.Name.men.selected = YES;
//    }
//    self.brithDate.nameTF1.text = self.info.birthdate;
//    //    self.jobDate.nameTF1.text = self.info.
//    self.school.nameTF1.text = self.info.school;
//    self.classInfo.nameTF1.text = self.info.t_class;
//    self.minSalary.nameTF1.text  = self.info.salarybase;
//    self.reword.nameTF1.text = self.info.disclassbonus;
//    self.user.nameTF1.text = self.info.phone;
//    self.user.nameTF2.text = self.info.pwd;
//    self.useSalary.nameTF1.text = self.info.workagebonus;
//}

- (void)addView{
    
    UIView * bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREEN_W, (item_height+10)*11)];
    bgView.backgroundColor = RGB(235, 235, 244);
    bgView.userInteractionEnabled = YES;
    [self.scroller addSubview:bgView];
    
    self.Name = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.Name configUISetWithName:@"教师姓名:" Name2:@"授课班级:"];
    
    
    self.salary = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.salary configUISetWithName:@"工资底薪:" Name2:@"工资奖金:"];
    
    self.class_salary = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.class_salary configUISetWithName:@"课销薪资" inputType:UIKeyboardTypeNumberPad];
    
    self.reword = [[Reword alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height*2)];
    [self.reword configUISetWithName:@"各项奖金" Button1:@"全勤奖" Button2:@"为生奖" Button3:@"互动奖" Button4:@"接待奖" Button5:@"转介绍奖"];
    
    self.rebackfee = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.rebackfee configUISetWithName:@"社保扣费:" Name2:@"学员退费:"];
    
    self.presonl = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.presonl configUISetWithName:@"学员过渡:" Name2:@"同步课:"];
    
    self.oneToClass = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.oneToClass configUISetWithName:@"一对一课时:" inputType:UIKeyboardTypeNumberPad];
    
    self.allSalary = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.allSalary configUISetWithName:@"总薪资:" inputType:UIKeyboardTypeNumberPad];
    
    [bgView addSubview:self.Name];
    [bgView addSubview:self.salary];
    [bgView addSubview:self.class_salary];
    [bgView addSubview:self.reword];
    [bgView addSubview:self.classInfo];
    [bgView addSubview:self.rebackfee];
    [bgView addSubview:self.presonl];
    [bgView addSubview:self.oneToClass];
    [bgView addSubview:self.allSalary];
    
    
    __weak typeof(self) weakSelf = self;
    [self.Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(bgView.mas_top);
    }];
    
    [self.salary mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.Name.mas_bottom).offset(10);
    }];
    
    [self.class_salary mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.salary.mas_bottom).offset(10);
    }];
    
    [self.reword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height*2);
        make.top.mas_equalTo(weakSelf.class_salary.mas_bottom).offset(10);
    }];
    
    
    [self.rebackfee mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.reword.mas_bottom).offset(10);
    }];
    
    [self.presonl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.rebackfee.mas_bottom).offset(10);
    }];
    [self.oneToClass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.presonl.mas_bottom).offset(10);
    }];
    
    [self.allSalary mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(item_height);
        make.top.mas_equalTo(weakSelf.oneToClass.mas_bottom).offset(10);
    }];
    
    [self.scroller layoutIfNeeded];
    
    self.commitView = [[CommitView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    self.commitView.titleName = @"提交";
    self.commitView.commmit = ^{
        //按钮响应
        [weakSelf commit];
    };
    [self.scroller addSubview:self.commitView];
    
    [self.commitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.allSalary.mas_bottom).offset(10);
        make.height.mas_equalTo(200);
    }];
    [self.scroller layoutIfNeeded];
    
    bgView.frame = CGRectMake(0, 0, SCREEN_W, CGRectGetMaxY(_commitView.frame)+10);
    self.scroller.contentSize = CGSizeMake(self.view.bounds.size.width,CGRectGetMaxY(_commitView.frame)+70);
}

- (void)commit{
    
}
//- (void)change{
//    if (!self.Name.nameTF.text || !self.brithDate ||!self.jobDate || !self.school||!self.classInfo||!self.minSalary||!self.reword ||!self.useSalary||!self.user||!self.personNum ) {
//
//    }else{
//        self.info.name = self.Name.nameTF.text;
//        self.info.sex = self.Name.women.selected ?0:1;
//        self.info.school = self.school.nameTF1.text;
//        self.info.salarybase = self.minSalary.nameTF1.text;
//        self.info.disclassbonus = self.reword.nameTF1.text;
//        self.info.phone = self.user.nameTF1.text;
//        self.info.workagebonus = self.useSalary.nameTF1.text;
//        self.info.pwd = self.user.nameTF2.text;
//        self.info.t_class = self.classInfo.nameTF1.text;
//        self.info.birthdate = self.brithDate.nameTF1.text;
//    }
//    //    [ZBNetworking shaerdInstance]
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
