//
//  TwoTextField.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "TwoTextField.h"

@implementation TwoTextField
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.BgView = [FactoryUI createViewWithFrame:self.frame];
        self.BgView.userInteractionEnabled = YES;
        [self configView];
        [self addOtherView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)addOtherView{
    
}

-(void)configView{
    
    [self addSubview:self.BgView];
    //    _BgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    //    _BgView.backgroundColor = RGB(230, 253, 253);
    //
    //    [self addSubview:_BgView];
    
    self.name1 = [[UILabel alloc] init];
    self.nameTF1 = [[UITextField alloc] init];
    self.name2 = [[UILabel alloc] init];
    self.nameTF2 = [[UITextField alloc] init];
    self.name1.text = @"name1";
    self.name2.text = @"name2";
    
    self.name1.font = LabelFont;
    self.nameTF1.font = LabelFont;
    self.name2.font = LabelFont;
    self.nameTF2.font = LabelFont;
    
    self.name2.textAlignment = NSTextAlignmentLeft;
    
    [self.BgView addSubview:self.nameTF1];
    [self.BgView addSubview:self.name1];
    [self.BgView addSubview:self.name2];
    [self.BgView addSubview:self.nameTF2];
    
}

- (void)configUISetWithName:(NSString *)name Name2:(NSString *)name2 {
    
    self.name1.text = name;

    self.name2.text = name2;
    
    CGSize size1 =  [name getStringSizeWithAtteributes:@{NSFontAttributeName: LabelFont}];
    CGSize size2 =  [name2 getStringSizeWithAtteributes:@{NSFontAttributeName: LabelFont}];
    
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
        make.width.equalTo(self).multipliedBy(0.3);
    }];
    
    [self.name2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(SCREEN_W/2);
        make.top.equalTo(self).offset(0);
        make.width.mas_equalTo(size2.width);
        make.height.mas_equalTo(@50);
    }];
    
    [self.nameTF2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name2.mas_right).with.offset(5);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self).multipliedBy(0.3);
    }];

}
- (void)refreshCell{
    
}

@end
