//
//  RebackMoneyController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "RebackMoneyController.h"
#import "TK_DateView.h"
#import "TK_NameView.h"
#import "TwoTextField.h"
#import "OneTextfiled.h"
#import "PayPursh.h"
#define item_height 44
@interface RebackMoneyController ()<UIScrollViewDelegate>

@property (nonatomic,strong) TK_NameView * nameView;
@property (nonatomic,strong) TK_DateView * m_date;
@property (nonatomic,strong) TwoTextField * backFee;
@property (nonatomic,strong) TwoTextField * classAmount;
@property (nonatomic,strong) TwoTextField * remainFee;
@property (nonatomic,strong) OneTextfiled * otherFee;
@property (nonatomic,strong) OneTextfiled * shouldPay;
@property (nonatomic,strong) PayPursh * payment_voucher;

@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) UIScrollView *scroller;
@end

@implementation RebackMoneyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self addView];
    
}
-(void)initView{
    self.title = @"退款管理";
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
    
    UIView * bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREEN_W, (item_height+10)*7)];
    bgView.backgroundColor = RGB(235, 235, 244);
    bgView.userInteractionEnabled = YES;
    [self.scroller addSubview:bgView];
    
    self.nameView = [[TK_NameView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.nameView configUISetWithName:@"姓名:" Name2:@"班级:"];
    
    self.m_date = [[TK_DateView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.m_date configUISetWithName:@"续费日期:" Name2:@"退费日期:"];
    self.m_date.nameTF1.text = @"200";
    
    self.backFee = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.backFee configUISetWithName:@"缴费金额:" Name2:@"课时总数:"];
    
    self.classAmount = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.classAmount configUISetWithName:@"课消总数:" Name2:@"课消金额:"];
    
    self.remainFee = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.remainFee configUISetWithName:@"剩余金额:" Name2:@"物品费用:"];
    
    self.otherFee = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.otherFee configUISetWithName:@"其他费用:" inputType:UIKeyboardTypeNumberPad];
    
    self.shouldPay = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.shouldPay configUISetWithName:@"应退金额:" inputType:UIKeyboardTypeNumberPad];
    
    [bgView addSubview:self.nameView];
    [bgView addSubview:self.m_date];
    [bgView addSubview:self.backFee];
    [bgView addSubview:self.otherFee];
    [bgView addSubview:self.remainFee];
    [bgView addSubview:self.shouldPay];
    [bgView addSubview:self.classAmount];
    
    NSArray * viewGroup = @[self.nameView,self.m_date,self.backFee,self.classAmount,self.remainFee,self.otherFee,self.shouldPay];
    [viewGroup mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:5 tailSpacing:5];
    
    [viewGroup mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bgView.mas_left);
        
        make.right.equalTo(bgView.mas_right);
        
    }];

}
#pragma mark - **************** action
#pragma mark - **************** setGET
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
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
