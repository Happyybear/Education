//
//  Reword.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/1.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "Reword.h"
#import "SexButton.h"

@interface Reword()
@property (nonatomic,strong) NSMutableArray * buttonArr;
@end

@implementation Reword

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
    self.name.font = LabelFont;
    
    self.buttonA = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"女" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10000 selector:@selector(sexClick:)];

    self.buttonB = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10001 selector:@selector(sexClick:)];
    
    self.buttonC = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10002 selector:@selector(sexClick:)];
    
    self.buttonD = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10003 selector:@selector(sexClick:)];
    
    self.buttonE = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10004 selector:@selector(sexClick:)];
    
    [self.buttonArr addObject:self.buttonA];
    [self.buttonArr addObject:self.buttonB];
    [self.buttonArr addObject:self.buttonC];
    [self.buttonArr addObject:self.buttonD];
    [self.buttonArr addObject:self.buttonE];
    
    self.name.text = @"姓名:";
    
    [self.bgView addSubview:self.name];
    [self.bgView addSubview:self.buttonA];
    [self.bgView addSubview:self.buttonB];
    [self.bgView addSubview:self.buttonC];
    [self.bgView addSubview:self.buttonD];
    [self.bgView addSubview:self.buttonE];
    
}

- (void)sexClick:(UIButton *)btn{
    if (btn.selected) {
        btn.selected = NO;
    }else{
        btn.selected = YES;
    }
    
}
- (void)configUISetWithName:(NSString *)name Button1:(NSString *)btn1 Button2:(NSString *)btn2 Button3:(NSString *)btn3 Button4:(NSString *)btn4 Button5:(NSString *)button5{
    
    self.name.text = name;
    
    [self.buttonA setTitle:btn1 forState:UIControlStateNormal];
    [self.buttonB setTitle:btn2 forState:UIControlStateNormal];
    [self.buttonC setTitle:btn3 forState:UIControlStateNormal];
    [self.buttonD setTitle:btn4 forState:UIControlStateNormal];
    [self.buttonE setTitle:button5 forState:UIControlStateNormal];
    
    CGSize size1 =  [btn1 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:9.0f]}];
    CGSize size2 = [btn2 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:9.0f]}];
    CGSize size3 =  [btn3 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:9]}];
    CGSize size4 = [btn4 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:9]}];
    CGSize size5 = [button5 getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:9]}];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.2);
        make.height.mas_equalTo(40);
    }];
    
    [self.buttonA mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).with.offset(10);
        make.height.mas_equalTo(@41);
        make.top.equalTo(_name.mas_bottom).offset(3);
        make.width.mas_offset(size1.width+25);
        
    }];
    
    [self.buttonB mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_buttonA.mas_right).with.offset(3);
        make.height.mas_equalTo(@41);
        make.top.equalTo(_name.mas_bottom).offset(3);
        make.width.mas_offset(size2.width+25);
    }];
    
    [self.buttonC mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_buttonB.mas_right).with.offset(3);
        make.height.mas_equalTo(@41);
        make.top.equalTo(_name.mas_bottom).offset(3);
        make.width.mas_offset(size3.width+25);
    }];
    
    [self.buttonD mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_buttonC.mas_right).with.offset(3);
        make.height.mas_equalTo(@41);
        make.top.equalTo(_name.mas_bottom).offset(3);
        make.width.mas_offset(size4.width+25);
    }];
    
    [self.buttonE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_buttonD.mas_right).offset(3);
        make.height.mas_equalTo(@41);
        make.top.equalTo(_name.mas_bottom).offset(3);
        make.width.mas_offset(size5.width+25);
    }];
    self.buttonA.titleLabel.font = [UIFont systemFontOfSize:9];
    self.buttonB.titleLabel.font = [UIFont systemFontOfSize:9];
    self.buttonC.titleLabel.font = [UIFont systemFontOfSize:9];
    self.buttonD.titleLabel.font = [UIFont systemFontOfSize:9];
    self.buttonE.titleLabel.font = [UIFont systemFontOfSize:9];
    
}

- (NSMutableArray *)buttonArr{
    if (!_buttonArr) {
        _buttonArr = [[NSMutableArray alloc] init];
    }
    return _buttonArr;
}

@end
