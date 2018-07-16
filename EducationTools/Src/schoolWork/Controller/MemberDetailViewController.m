//
//  MemberDetailViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "MemberDetailViewController.h"
#import "NameAndSex.h"
#import "ClassSelectView.h"
#import "TwoTextField.h"
#import "OneTextfiled.h"
#import "PaypurshView.h"
#import "oneSelectedView.h"
#import "RemarkView.h"
#import "CommitView.h"
#import "SchoolStudentModel.h"
#import "ClassModel.h"
#define item_height 44
@interface MemberDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scroller;
@property (nonatomic,strong) SchoolStudentModel *studentModel;


@property (nonatomic,copy) NSString *brith;

//班级
@property (nonatomic, strong) oneSelectedView * classmate;
@property (nonatomic,strong) NameAndSex *Name;
//班级
@property (nonatomic, strong) oneSelectedView * brithDate;
//年及
@property (nonatomic,strong) ClassSelectView *grade;
@property (nonatomic,strong) OneTextfiled *school;
@property (nonatomic,strong) OneTextfiled *parentName;
@property (nonatomic,strong) OneTextfiled *phone;
@property (nonatomic,strong) ClassSelectView *fee;
@property (nonatomic,strong) TwoTextField *classAmount;
@property (nonatomic,strong) PaypurshView *recieve;
@property (nonatomic,strong) RemarkView *remark;
@property (nonatomic,strong) CommitView*commitView;

@end

@implementation MemberDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self initView];
    [self addView];
}
#pragma mark - **************** UI
-(void)initView{
    
    self.title = @"会员管理";
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

- (void)addView{
    
    UIView * bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREEN_W, (item_height+10)*10)];
    bgView.backgroundColor = RGB(235, 235, 244);
    bgView.userInteractionEnabled = YES;
    [self.scroller addSubview:bgView];
    
    self.classmate = [[oneSelectedView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.classmate configUISetWithName:@"班级:" inputType:UIKeyboardTypeDefault];
    
    
    self.Name = [[NameAndSex alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.Name configUISetWithName:@"姓名:" textfiled:nil Name2:@"性别" Button:@"男" Button:@"女"];
    
    
    self.brithDate = [[oneSelectedView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.brithDate configUISetWithName:@"出生日期:" inputType:UIKeyboardTypeDefault];
    [self.brithDate configPicker:nil type:timeDate resut:^(id object) {
        
    }];
    
    self.grade = [[ClassSelectView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.grade configUISetWithName:@"年级:" textfiled:nil Name2:@"学过英语" Button:@"是" Button:@"否"];
    
    self.school = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.school configUISetWithName:@"就读学校:" inputType:UIKeyboardTypeDefault];
    
    self.parentName = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.parentName configUISetWithName:@"家长姓名:" inputType:UIKeyboardTypeDefault];
    
    self.phone = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.parentName configUISetWithName:@"联系电话:" inputType:UIKeyboardTypeDefault];
    
    
//    self.classAmount = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
////    [self.fee configUISetWithName:@"" textfiled:<#(NSString *)#> Name2:<#(NSString *)#> Button:<#(NSString *)#> Button:<#(NSString *)#>
//
//
//    self.payMethod = [[PayMethodView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
//    [self.payMethod configUISetWithName:@"支付方式:" Button1:@"微信" Button2:@"支付宝" Button3:@"刷卡" Button4:@"现金"];
    self.fee = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
//    [self.fee configUISetWithName:@"课时总数:" Name2:@"服务专员:"];
    
    self.classAmount = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.classAmount configUISetWithName:@"课时总数:" Name2:@"服务专员:"];
    
    self.recieve = [[PaypurshView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    //    [self.recieve configUISetWithName:@"领取物品" Button1:@"书包" Button2:@"课本" Button3:@"玩具" Button4:@"未领取"];
    
    //    [self.payment_voucher configUISetWithName:@"服务专员" inputType:UIKeyboardTypeDefault];
    [bgView addSubview:self.grade];
    [bgView addSubview:self.Name];
    [bgView addSubview:self.brithDate];
    [bgView addSubview:self.grade];
    [bgView addSubview:self.school];
    [bgView addSubview:self.parentName];
    [bgView addSubview:self.phone];
    [bgView addSubview:self.fee];
    [bgView addSubview:self.classmate];
    [bgView addSubview:self.classAmount];
    [bgView addSubview:self.recieve];
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    bg.backgroundColor = [UIColor whiteColor];
    
    
    //    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.frame = CGRectMake((SCREEN_W-200)/2, CGRectGetMaxY(self.personNum.frame)+30, 200, 44);
    //
    //    btn.layer.cornerRadius = 5;
    //    [btn setTitle:@"提交" forState:UIControlStateNormal];
    //    btn.backgroundColor = [UIColor blueColor];
    //    [btn addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    
    //    [self.scroller addSubview:btn];
    NSMutableArray * viewGroup = @[self.classmate,self.Name,self.brithDate,self.grade,self.school,self.parentName,self.phone,self.fee,self.classAmount,self.recieve];
    /**
     *  确定间距等间距布局
     *
     *  @param axisType     布局方向
     *  @param fixedSpacing 两个item之间的间距(最左面的item和左边, 最右边item和右边都不是这个)
     *  @param leadSpacing  第一个item到父视图边距
     *  @param tailSpacing  最后一个item到父视图边距
     */
    [viewGroup mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:5 tailSpacing:5];

    [viewGroup mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(bgView.mas_left);

        make.right.equalTo(bgView.mas_right);

    }];
    
//
//
    self.remark = [[RemarkView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 230)];
    self.commitView = [[CommitView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    self.commitView.titleName = @"提交";
    self.commitView.commmit = ^{
        //按钮响应
//        [weakSelf commit];
    };
//
    [self.scroller addSubview:self.remark];
    [self.scroller addSubview:self.commitView];
//
//    [self.payment_voucher mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view.mas_left);
//        make.width.mas_equalTo(SCREEN_W);
//        make.top.mas_equalTo(bgView.mas_bottom).offset(10);
//        make.height.mas_equalTo(self.payment_voucher.frame.size.height);
//    }];
//
    [self.remark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(bgView.mas_bottom).offset(20);
        make.height.mas_equalTo(230);
    }];
    [self.commitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.remark.mas_bottom).offset(20);
        make.height.mas_equalTo(200);
    }];
//
//    [weakSelf.scroller layoutIfNeeded];
//
//    self.scroller.contentSize = CGSizeMake(self.view.bounds.size.width,CGRectGetMaxY(self.commitView.frame));
}

- (void)refreshUI{
    self.classmate.nameTF1.text = self.studentModel.m_class;
    
    self.Name.name.text = self.studentModel.name;
    if (self.studentModel.sex == 0) {
        self.Name.women.selected = YES;
    }else{
        self.Name.men.selected = YES;
    }
    
    self.brithDate.nameTF1.text = self.studentModel.birthdate;
    
    if (self.studentModel.learn == 0) {
        self.grade.women.selected = YES;
    }else{
        self.grade.men.selected = YES;
    }
    
    self.school.nameTF1.text = self.studentModel.school;
    
    self.parentName.nameTF1.text = self.studentModel.parent1;
    
    self.phone.nameTF1.text = self.studentModel.phone1;
    
    self.fee;
    
    self.classAmount.nameTF1.text = self.studentModel.classamount;
    self.classAmount.nameTF2.text = self.studentModel.serviceuser;
//    self.recieve
}
#pragma mark - **************** LoadData
- (void)loadData{
    [self getInfo];
    [self getClassmate];
    
}

- (void)getInfo{
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:self.student_id forKey:@"id"];
    [dict setObject:@2 forKey:@"mode"];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:QStudent jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        DLog(@"%@",response);
        [self.mTableView.mj_header endRefreshing];
        if ([[response objectForKey:@"result"]intValue] == 0 ) {
            selfWeak.studentModel = [SchoolStudentModel yy_modelWithJSON:[response objectForKey:@"jsondata"]];
            [selfWeak refreshUI];
        }else{
            
        }
    } failBlock:^(NSError *error) {
        
    }];
}
- (void)getClassmate{
    //更新UI
    @WeakObj(self);
    NSMutableArray *tempWord =[NSMutableArray array];
    for (ClassModel *classModel in self.allclassData) {
        if (classModel.name) {
            [tempWord addObject:classModel.name];
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [selfWeak.classmate configPicker:tempWord type:1 resut:^(id object) {
            //获取class_id
            ClassModel * model = selfWeak.allclassData[[object intValue]+1];
            selfWeak.studentModel.m_class = model.class_id;
            selfWeak.classmate.nameTF1.text = model.name;
        }];
    });
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
