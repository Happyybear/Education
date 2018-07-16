//
//  ApprocalViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ApprocalViewController.h"
#import "NameCell.h"
#import "NameAndSex.h"
#import "TwoTextField.h"
#import "OneTextfiled.h"
#import "BrithView.h"
#import "PayNumView.h"
#import "PayMethodView.h"
#import "PayPursh.h"
#import "PhotoSeletorModel.h"
#import "RemarkView.h"
#import "CommitView.h"
#define item_height 50
@interface ApprocalViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scroller;

@property (nonatomic,strong) NSMutableArray * dataSource;

@property (nonatomic,strong) OneTextfiled * payCount;

@property (nonatomic,strong) OneTextfiled * payKind;

@property (nonatomic,strong) RemarkView * remark;

@property (nonatomic,strong) RemarkView * fee_detail;

@property (nonatomic,strong) PayPursh * payment_voucher;

@property (nonatomic,strong) CommitView * commitView;

@property (nonatomic,strong) PhotoSeletorModel *photoModel;
@end

@implementation ApprocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    
    [self addView];
}

-(void)initView{
    
    self.title = @"财务审批";
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
    
    UIView * bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREEN_W, (item_height+10)*11)];
    bgView.backgroundColor = RGB(235, 235, 244);
    bgView.userInteractionEnabled = YES;
    [self.scroller addSubview:bgView];
    

    self.payCount = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.payCount configUISetWithName:@"支出金额:" inputType:UIKeyboardTypeNumberPad];
    
    self.payKind = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.payCount configUISetWithName:@"支出类别:" inputType:UIKeyboardTypeNumberPad];
    
    self.remark = [[RemarkView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    
    self.fee_detail = [[RemarkView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    
    _photoModel = [[PhotoSeletorModel alloc] init];
    self.payment_voucher = [[PayPursh alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height+(([UIScreen mainScreen].bounds.size.width - 24) - 3 * (3 - 1)) / 3)];
    self.payment_voucher.model = self.photoModel;
    __weak typeof(self) weakSelf = self;
    [self.payment_voucher setPhotoViewChangeHeightBlock:^{
        weakSelf.payment_voucher.frame = CGRectMake(0, 0, SCREEN_W, item_height+_photoModel.cellHeight);
        //修改下边距约束
        [weakSelf.payment_voucher mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(item_height+_photoModel.cellHeight);
        }];
        [UIView animateWithDuration:0.3 animations:^{
            [weakSelf.scroller layoutIfNeeded];
            weakSelf.scroller.contentSize = CGSizeMake(weakSelf.view.bounds.size.width,CGRectGetMaxY(weakSelf.commitView.frame));
        }];
    }];
    

    self.commitView = [[CommitView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    self.commitView.titleName = @"提交";
    self.commitView.commmit = ^{
        //按钮响应
        
    };
    [bgView addSubview:self.payCount];
    [bgView addSubview:self.payment_voucher];
    [bgView addSubview:self.payKind];
    [bgView addSubview:self.remark];
    [bgView addSubview:self.commitView];
    [bgView addSubview:self.fee_detail];
    
    [self.payCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(bgView.mas_top).offset(10);
        make.height.mas_equalTo(item_height);
    }];
     
     [self.payKind mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(weakSelf.payCount.mas_bottom).offset(10);
        make.height.mas_equalTo(item_height);
    }];
    
    [self.fee_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.payKind.mas_bottom).offset(10);
        make.height.mas_equalTo(200);
    }];
    
    [self.payment_voucher mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.fee_detail.mas_bottom).offset(10);
        make.height.mas_equalTo(weakSelf.payment_voucher.frame.size.height);
    }];
    
    [self.remark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.payment_voucher.mas_bottom).offset(10);
        make.height.mas_equalTo(200);
    }];
    
    [self.commitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.remark.mas_bottom).offset(0);
        make.height.mas_equalTo(200);
    }];
    
    [weakSelf.scroller layoutIfNeeded];
    
    bgView.frame = CGRectMake(0, 0, SCREEN_W, CGRectGetMaxY(self.commitView.frame));
    self.scroller.contentSize = CGSizeMake(self.view.bounds.size.width,CGRectGetMaxY(self.commitView.frame));
}

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
