//
//  PayNumView.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PayNumView.h"
#import "SexButton.h"
@interface PayNumView()

@property (nonatomic, strong) NSMutableArray * buttonArray;

@end
@implementation PayNumView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)configView{
    
    self.bgView = [FactoryUI createViewWithFrame:self.frame];
    [self addSubview:self.bgView];
    //    _BgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    //    _BgView.backgroundColor = RGB(230, 253, 253);
    //
    //    [self.contentView addSubview:_BgView];
    
    self.name = [[UILabel alloc] init];
    self.nameTF = [[UITextField alloc] init];
    
    self.name.font = LabelFont;
    self.nameTF.font = LabelFont;

    
    self.btnA = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"女" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10000 selector:@selector(sexClick:)];
    
    self.btnB = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10001 selector:@selector(sexClick:)];
    
    self.btnC = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10002 selector:@selector(sexClick:)];
    
    [self.buttonArray addObject:self.btnA];
    [self.buttonArray addObject:self.btnB];
    [self.buttonArray addObject:self.btnC];
    
    self.name.text = @"姓名:";
    
    [self.bgView addSubview:self.nameTF];
    [self.bgView addSubview:self.name];
    [self.bgView addSubview:self.btnA];
    [self.bgView addSubview:self.btnB];
    [self.bgView addSubview:self.btnC];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.2);
        make.height.mas_equalTo(@50);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).with.offset(10);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self).multipliedBy(0.3);
    }];
    
    
//    [_men mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(_nameTF.mas_right).with.offset(5);
//        make.height.mas_equalTo(@44);
//        make.top.equalTo(self).offset(3);
//        make.width.mas_offset(@50);
//
//    }];
//
//    [_women mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(_men.mas_right).with.offset(10);
//        make.height.mas_equalTo(@44);
//        make.top.equalTo(self).offset(3);
//        make.width.mas_offset(@50);
//    }];
//
    
}
- (void)sexClick:(UIButton *)btn{
    
    if (btn.selected == YES) {
        btn.selected = NO;
        self.seleceItem = @"";
    }else{
        btn.selected = YES;
        self.seleceItem = [NSString stringWithFormat:@"%ld",btn.tag - 10000 +1];
        for (UIButton * item in self.buttonArray) {
            if (item.tag == btn.tag) {
                
            }else{
                item.selected = NO;
            }
        }
    }
}

- (void)configUISetWithName:(NSString *)name inputType:(UIKeyboardType)keybooard Name2:(NSString *)name2 Button1:(NSString *)btn1 Button2:(NSString *)btn2 Button3:(NSString *)btn3{
    self.name.text = name;
    if (keybooard) {
        self.nameTF.keyboardType = keybooard;
    }
    [self.btnA setTitle:btn1 forState:UIControlStateNormal];
    [self.btnB setTitle:btn2 forState:UIControlStateNormal];
    [self.btnC setTitle:btn3 forState:UIControlStateNormal];
    
    CGSize size1 =  [btn1 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]}];
    CGSize size2 = [btn2 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]}];
    CGSize size3 = [btn3 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11.0f]}];
    
    [_btnA mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_nameTF.mas_right).with.offset(5);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(size1.width+30);
        
    }];
    
    [_btnB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_btnA.mas_right).with.offset(0);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(size2.width+30);
    }];
    
    [_btnC mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_btnB.mas_right).with.offset(0);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(size3.width+30);
    }];

}

- (NSMutableArray *)buttonArray{
    if (!_buttonArray) {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}
@end
