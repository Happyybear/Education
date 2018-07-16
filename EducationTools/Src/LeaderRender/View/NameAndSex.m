//
//  NameAndSex.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "NameAndSex.h"
#import "SexButton.h"
@implementation NameAndSex

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)configView{
    
    self.bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.bgView.userInteractionEnabled = YES;
    [self addSubview:_bgView];
    
    self.name = [[UILabel alloc] init];
    self.name.font = LabelFont;
    
    self.nameTF = [[UITextField alloc] init];
    self.sex = [[UILabel alloc] init];
    
    self.sex.font = LabelFont;;
    self.nameTF.font = LabelFont;
    
    self.women = [SexButton buttonWithType:UIButtonTypeCustom];
    self.women.frame = CGRectMake(0, 0, 50, 44);
    
    [self.women setTitle:@"女" forState:UIControlStateNormal];
    
    
    self.women = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"女" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10000 selector:@selector(sexClick:)];
    
    self.men = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10001 selector:@selector(sexClick:)];
    
    self.name.text = @"姓名:";
    self.sex.text = @"性别";
    
    [self.bgView addSubview:self.nameTF];
    [self.bgView addSubview:self.name];
    [self.bgView addSubview:self.women];
    [self.bgView addSubview:self.men];
    [self.bgView addSubview:self.sex];
    
//    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(10);
//        make.top.equalTo(self).offset(0);
//        make.width.equalTo(self).multipliedBy(0.1);
//        make.height.mas_equalTo(@50);
//    }];
//
//    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_name.mas_right).with.offset(5);
//        make.top.equalTo(self).offset(0);
//        make.height.mas_equalTo(@50);
//        make.width.equalTo(self).multipliedBy(0.25);
//    }];
//
//    [_sex mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(self).with.offset(SCREEN_W/2);
//        make.height.mas_equalTo(@50);
//        make.top.equalTo(self).offset(0);
//        make.width.equalTo(self).multipliedBy(0.18);
//
//    }];
//
//    [_men mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(_sex.mas_right).with.offset(5);
//        make.height.mas_equalTo(@41);
//        make.top.equalTo(self).offset(3);
//        make.width.mas_offset(@40);
//
//    }];
//
//    [_women mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.equalTo(_men.mas_right).with.offset(5);
//        make.height.mas_equalTo(@41);
//        make.top.equalTo(self).offset(3);
//        make.width.mas_offset(@40);
//    }];
    
    
}
- (void)sexClick:(UIButton *)btn{
    if (btn.tag == 10000) {
        if (btn.selected) {
            self.women.selected = NO;
        }else{
            self.women.selected = YES;
            self.men.selected = NO;
        }
    }else{
        if (btn.selected) {
            self.men.selected = NO;
        }else{
            self.men.selected = YES;
            self.women.selected = NO;
        }
    }
}

- (void)configUISetWithName:(NSString *)name textfiled:(NSString *)teName Name2:(NSString *)name2 Button:(NSString *)btn1 Button:(NSString *)btn2{
    self.name.text = name;
    if(!teName){
     self.nameTF.placeholder = teName;
    }
    self.sex.text = name2;
    [self.men setTitle:btn1 forState:UIControlStateNormal];
    [self.women setTitle:btn2 forState:UIControlStateNormal];
    
    CGSize size1 =  [name getStringSizeWithAtteributes:@{NSFontAttributeName: LabelFont}];
    CGSize size2 = [name2 getStringSizeWithAtteributes:@{NSFontAttributeName: LabelFont}];

    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.mas_equalTo(size1.width);
        make.height.mas_equalTo(@50);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).with.offset(5);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self).multipliedBy(0.25);
    }];
    
    [_sex mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).with.offset(SCREEN_W/2);
        make.height.mas_equalTo(@50);
        make.top.equalTo(self).offset(0);
        make.width.mas_equalTo(size2.width);
        
    }];
    
    [_men mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_sex.mas_right).with.offset(5);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(@40);
        
    }];
    
    [_women mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_men.mas_right).with.offset(5);
        make.height.mas_equalTo(@41);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(@40);
    }];

}

- (void)layoutSubviews{
    
}
- (void)setStyle{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
