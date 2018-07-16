//
//  OneTextfiled.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "OneTextfiled.h"

@implementation OneTextfiled

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgView = [FactoryUI createViewWithFrame:self.frame];
        self.bgView.userInteractionEnabled = YES;
        [self addSubview:self.bgView];
        [self configView];
        [self addOtherView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)addOtherView{
    
}

-(void)configView{
    
    self.name1 = [[UILabel alloc] init];
    self.name1.font = [UIFont systemFontOfSize:13];
    self.nameTF1 = [[UITextField alloc] init];
    self.nameTF1.font = [UIFont systemFontOfSize:13];;
    self.name1.text = @"name1";

    
    [self.bgView addSubview:self.nameTF1];
    [self.bgView addSubview:self.name1];

}

- (void)configUISetWithName:(NSString *)name inputType:(UIKeyboardType)keyboard{
    self.name1.text = name;
    if (keyboard) {
        self.nameTF1.keyboardType = keyboard;
    }
    CGSize size1 =  [name getStringSizeWithAtteributes:@{NSFontAttributeName: LabelFont}];
    
    
    [self.name1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.mas_equalTo(size1.width);
        make.height.mas_equalTo(@50);
    }];
    
    [self.nameTF1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name1.mas_right).with.offset(5);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self).multipliedBy(0.7);
    }];

}
- (void)refreshCell{
    
}
@end
