//
//  PayMethodView.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PayMethodView.h"
#import "SexButton.h"

@interface PayMethodView()

@property (nonatomic,strong) NSMutableArray * buttonArr;

@end

@implementation PayMethodView

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
    
    self.BgView = [FactoryUI createViewWithFrame:self.frame];
    [self addSubview:self.bgView];
    //    _BgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    //    _BgView.backgroundColor = RGB(230, 253, 253);
    //
    //    [self.contentView addSubview:_BgView];
    
    self.name = [[UILabel alloc] init];
    self.name.font = LabelFont;

    self.weichat = [SexButton buttonWithType:UIButtonTypeCustom];
    
    
    self.weichat = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"女" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10000 selector:@selector(sexClick:)];
    
    self.alipay = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10001 selector:@selector(sexClick:)];
    
    self.card = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10002 selector:@selector(sexClick:)];
    
    self.carsh = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10003 selector:@selector(sexClick:)];
    
    [self.buttonArr addObject:self.weichat];
    [self.buttonArr addObject:_alipay];
    [self.buttonArr addObject:self.card];
    [self.buttonArr addObject:self.carsh];
    
    self.name.text = @"姓名:";
    
    [self.bgView addSubview:self.name];
    [self.bgView addSubview:self.weichat];
    [self.bgView addSubview:self.alipay];
    [self.bgView addSubview:self.carsh];
    [self.bgView addSubview:self.card];
    
    
    
    
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
    if (btn.selected) {
        btn.selected = NO;
    }else{
        for (UIButton * b in self.buttonArr) {
            if (btn.tag == b.tag) {
                btn.selected = YES;
            }else{
                b.selected = NO;
            }
        }
    }

}

- (void)configUISetWithName:(NSString *)name Button1:(NSString *)btn1 Button2:(NSString *)btn2 Button3:(NSString *)btn3 Button4:(NSString *)btn4{
    
    self.name.text = name;
 
    [self.weichat setTitle:btn1 forState:UIControlStateNormal];
    [self.alipay setTitle:btn2 forState:UIControlStateNormal];
    [self.carsh setTitle:btn3 forState:UIControlStateNormal];
    [self.card setTitle:btn4 forState:UIControlStateNormal];
    
    CGSize size1 =  [btn1 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]}];
    CGSize size2 = [btn2 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]}];
    CGSize size3 =  [btn3 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]}];
    CGSize size4 = [btn4 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]}];
    
    [_weichat mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_name.mas_right).with.offset(10);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(size1.width+25);
        
    }];
    
    [_alipay mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_weichat.mas_right).with.offset(10);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(size2.width+25);
    }];
    
    [_carsh mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_alipay.mas_right).with.offset(3);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(size3.width+25);
    }];
    
    [_card mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_carsh.mas_right).with.offset(3);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(size4.width+25);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.2);
        make.height.mas_equalTo(@50);
    }];
    
}

- (NSMutableArray *)buttonArr{
    if (!_buttonArr) {
        _buttonArr = [[NSMutableArray alloc] init];
    }
    return _buttonArr;
}

@end
