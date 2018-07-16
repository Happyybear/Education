//
//  LeaderRenderViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "LeaderRenderViewController.h"
#import "AddStudentModel.h"
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
#import "GoodsModel.h"
#import "PaypurshView.h"
#import "ClassSelectView.h"
#import "oneSelectedView.h"
#import "ClassModel.h"
#define item_height 44
@interface LeaderRenderViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSMutableArray * dataSource;
@property (nonatomic,strong) NSMutableArray * goodsData;
@property (nonatomic,copy) NSString * classValue;
@property (nonatomic,strong) UIScrollView *scroller;

@property (nonatomic,strong) NameAndSex *Name;
@property (nonatomic,strong) BrithView *brith;
@property (nonatomic, strong) oneSelectedView *classmate;
@property (nonatomic,strong) ClassSelectView *grade;
@property (nonatomic,strong) TwoTextField *phone1;
@property (nonatomic,strong) TwoTextField *phone2;
@property (nonatomic,strong) OneTextfiled *fee;
@property (nonatomic,strong) PayNumView *pay;
@property (nonatomic,strong) PayMethodView *payMethod;
@property (nonatomic,strong) OneTextfiled *classNum;
@property (nonatomic,strong) OneTextfiled *personNum;
@property (nonatomic,strong) PaypurshView *recieve;
@property (nonatomic,strong) PayPursh *payment_voucher;
@property (nonatomic,strong) RemarkView *remark;
@property (nonatomic,strong) CommitView * commitView;
@property (nonatomic,strong) PhotoSeletorModel * photoModel;


@end

@implementation LeaderRenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self addView];
    
    [self queryGoods];
    
    [self getClassmateInfo];
}

-(void)initView{

    self.title = @"校区报帐";
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
    
    UIView * bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, SCREEN_W, (item_height+10)*12)];
    bgView.backgroundColor = RGB(235, 235, 244);
    bgView.userInteractionEnabled = YES;
    [self.scroller addSubview:bgView];
    
    self.Name = [[NameAndSex alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.Name configUISetWithName:@"姓名:" textfiled:nil Name2:@"性别" Button:@"男" Button:@"女"];

    
    self.brith = [[BrithView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.brith configUISetWithName:@"出生日期:" Name2:@"就读学校:"];
    
    self.classmate = [[oneSelectedView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.classmate configUISetWithName:@"班级:" inputType:UIKeyboardTypeDefault];
    
    self.grade = [[ClassSelectView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.grade configUISetWithName:@"年级:" textfiled:nil Name2:@"学过英语" Button:@"是" Button:@"否"];
    
    self.phone1 = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.phone1 configUISetWithName:@"家长姓名:" Name2:@"电话:"];
    
    self.phone2 = [[TwoTextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.phone2 configUISetWithName:@"家长姓名:" Name2:@"电话:"];
    
    self.fee = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.fee configUISetWithName:@"应缴金额:" inputType:UIKeyboardTypeNumberPad];
    
    self.pay = [[PayNumView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.pay configUISetWithName:@"实付金额:" inputType:UIKeyboardTypeNumberPad Name2:nil Button1:@"定金" Button2:@"全款" Button3:@"尾款"];
    
    self.payMethod = [[PayMethodView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.payMethod configUISetWithName:@"支付方式:" Button1:@"微信" Button2:@"支付宝" Button3:@"刷卡" Button4:@"现金"];
    
    self.recieve = [[PaypurshView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
//    [self.recieve configUISetWithName:@"领取物品" Button1:@"书包" Button2:@"课本" Button3:@"玩具" Button4:@"未领取"];
    
    self.classNum = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.classNum configUISetWithName:@"课时总数" inputType:UIKeyboardTypeNumberPad];
    
    self.personNum = [[OneTextfiled alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, item_height)];
    [self.personNum configUISetWithName:@"服务专员" inputType:UIKeyboardTypeDefault];
    
//    [self.payment_voucher configUISetWithName:@"服务专员" inputType:UIKeyboardTypeDefault];

    [bgView addSubview:self.Name];
    [bgView addSubview:self.brith];
    [bgView addSubview:self.grade];
    [bgView addSubview:self.phone1];
    [bgView addSubview:self.phone2];
    [bgView addSubview:self.fee];
    [bgView addSubview:self.pay];
    [bgView addSubview:self.payMethod];
    [bgView addSubview:self.recieve];
    [bgView addSubview:self.classNum];
    [bgView addSubview:self.personNum];
    [bgView addSubview:self.payment_voucher];
    [bgView addSubview:self.classmate];
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
    NSMutableArray * viewGroup = @[self.Name,self.brith,self.classmate, self.grade,self.phone1,self.phone2,self.fee,self.pay,self.payMethod,self.classNum,self.personNum,self.recieve];
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
    
    _photoModel = [[PhotoSeletorModel alloc] init];
    self.payment_voucher = [[PayPursh alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame)+10, SCREEN_W, item_height+(([UIScreen mainScreen].bounds.size.width - 24) - 3 * (3 - 1)) / 3)];
    self.payment_voucher.model = self.photoModel;
    __weak typeof(self) weakSelf = self;
    [self.payment_voucher setPhotoViewChangeHeightBlock:^{
        weakSelf.payment_voucher.frame = CGRectMake(0, CGRectGetMaxY(bgView.frame)+10, SCREEN_W, item_height+_photoModel.cellHeight);
        //修改下边距约束
        [weakSelf.payment_voucher mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(item_height+_photoModel.cellHeight);
        }];
        [UIView animateWithDuration:0.3 animations:^{
            [weakSelf.scroller layoutIfNeeded];
            weakSelf.scroller.contentSize = CGSizeMake(weakSelf.view.bounds.size.width,CGRectGetMaxY(weakSelf.commitView.frame));
        }];
    }];
    [self.scroller addSubview:self.payment_voucher];
    
    
    self.remark = [[RemarkView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 230)];
    self.commitView = [[CommitView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    self.commitView.titleName = @"提交";
    self.commitView.commmit = ^{
        //按钮响应
        [weakSelf commit];
    };
    
    [self.scroller addSubview:self.remark];
    [self.scroller addSubview:self.commitView];
    
    [self.payment_voucher mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(bgView.mas_bottom).offset(10);
        make.height.mas_equalTo(self.payment_voucher.frame.size.height);
    }];
    
    [self.remark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.payment_voucher.mas_bottom).offset(20);
        make.height.mas_equalTo(230);
    }];
    [self.commitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(SCREEN_W);
        make.top.mas_equalTo(self.remark.mas_bottom).offset(20);
        make.height.mas_equalTo(200);
    }];
    
    [weakSelf.scroller layoutIfNeeded];
    
    self.scroller.contentSize = CGSizeMake(self.view.bounds.size.width,CGRectGetMaxY(self.commitView.frame));
}
#pragma mark - **************** netWork
- (void)getClassmateInfo{
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:@1 forKey:@"mode"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:QClass jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        if ([[response objectForKey:@"result"] intValue] == 0) {
            //获取校区成功
            NSDictionary * dictData = [response objectForKey:@"jsondata"];
            
            NSArray * classArr = dictData[@"class"];
            NSMutableArray * temp = [[NSMutableArray alloc] init];
            NSMutableArray * tempWord = [[NSMutableArray alloc] init];
            for (NSDictionary * dict in classArr) {
                DLog(@"%@",[dict objectForKey:@"name"]);
                ClassModel * model = [ClassModel yy_modelWithDictionary:dict];
                [temp addObject:model];
                [tempWord addObject:model.name];
            }
            
            //更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [selfWeak.classmate configPicker:tempWord type:1 resut:^(id object) {
                    ClassModel * model = temp[[object intValue]];
                    selfWeak.classValue = model.class_id;
                }];
            });
        }else{
            
        }
    } failBlock:^(NSError *error) {
        
    }];

}
- (void)commit{
    
    AddStudentModel * AddModel = [[AddStudentModel alloc] init];
    AddModel.name = self.Name.nameTF.text;
    AddModel.sex = self.Name.women.selected ?0:1;
    AddModel.birthdate = self.brith.name1TF.text;
    AddModel.school = self.brith.name2TF.text;
    AddModel.grade = [self.grade.selectedItemID intValue];
    AddModel.m_class = self.classValue;
    AddModel.learn = self.grade.men.selected?1:0;
    AddModel.parent1 = self.phone1.nameTF1.text;
    AddModel.phone1 = self.phone1.nameTF2.text;
    AddModel.phone2 = self.phone2.nameTF2.text;
    AddModel.parent2 = self.phone2.nameTF1.text;
    AddModel.shouldpay = self.fee.nameTF1.text;
    AddModel.practicalpay = self.pay.nameTF.text;
    AddModel.paytype = [self.pay.seleceItem intValue];
    AddModel.classamount = self.classNum.nameTF1.text;
//    self.payment_voucher.photoUrl
    if (self.payMethod.weichat.selected) {
        AddModel.paymode = 1;
    }else if (self.payMethod.alipay.selected){
        AddModel.paymode = 2;
    }else if (self.payMethod.card.selected){
        AddModel.paymode = 3;
    }else if(self.payMethod.carsh.selected){
        AddModel.paymode = 4;
    }
    //photo文件名
    // 可以在上传时使用当前的系统事件作为文件名
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
    
    AddModel.serviceuser = self.personNum.nameTF1.text;
    AddModel.payremark = self.remark.textView.text;
    AddModel.payvoucher = fileName;
    //领取物品
    NSMutableString *goodsString = [[NSMutableString alloc] init];
    for (NSString * string in self.recieve.selectedItem) {
        [goodsString appendString:string];
//        [goodsString appendString:@";"];
    }
    
    AddModel.goods = goodsString;
    
    //photoData
    NSDictionary * dict = [AddModel yy_modelToJSONObject];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    UIImage *photo = [UIImage imageWithContentsOfFile:self.payment_voucher.photoUrl];
    NSData *photoData = UIImageJPEGRepresentation(photo, 0.5);

    //图片
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:AStudent jsonData:data jsonName:@"jsondata" file:photoData fileName:fileName fileType:self.payment_voucher.photoType progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        DLog(@"%@",response);
    } failBlock:^(NSError *error) {
        
    }];
}

- (void)queryGoods{
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@1 forKey:@"mode"];
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance] uploadJsonDataWithUrl:QGoods jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        DLog(@"%@",response);
        if ([[response objectForKey:@"result"] intValue] == 0) {
            self.goodsData = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in response[@"jsondata"]) {
                GoodsModel * good = [GoodsModel yy_modelWithJSON:dict];
                [selfWeak.goodsData addObject:good];
                [selfWeak setGoodS];
            }
        }else{
            
        }
    } failBlock:^(NSError *error) {
        DLog(@"%@",error);
    }];
}

- (void)setGoodS{
    [self.recieve configView:self.goodsData title:@"领取物品"];
}
#pragma mark - **************** getSet
- (NSMutableArray *)goodsData{
    if (!_goodsData) {
        _goodsData = [[NSMutableArray alloc] init];
    }
    return _goodsData;
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
