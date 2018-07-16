//
//  PickerViewModle.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PickerViewModle.h"

@implementation PickerViewModle

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
    
    
    self.mbgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:self.mbgView];
    
    self.name1 = [[UILabel alloc] init];
    self.nameTF1 = [[UITextField alloc] init];
    self.name1.text = @"name1";
    
    self.name1.font = LabelFont;
    self.nameTF1.font = LabelFont;
    self.nameTF1.font = LabelFont;
    
    [self.mbgView addSubview:self.nameTF1];
    [self.mbgView addSubview:self.name1];
    
    [self.name1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.18);
        make.height.mas_equalTo(@50);
    }];
    
    [self.nameTF1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name1.mas_right).with.offset(5);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self).multipliedBy(0.7);
    }];
    
}

- (void)configUISetWithName:(NSString *)name inputType:(UIKeyboardType)keyboard{
    self.name1.text = name;
    if (keyboard) {
        self.nameTF1.keyboardType = keyboard;
    }
    
}

@end
