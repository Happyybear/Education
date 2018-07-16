//
//  BrithView.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BrithView.h"

@implementation BrithView

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
    
    self.name1 = [[UILabel alloc] init];
    self.name1TF = [[UITextField alloc] init];
    self.name2 = [[UILabel alloc] init];
    self.name2TF = [[UITextField alloc] init];
    
    self.name1.font = LabelFont;
    self.name2.font=LabelFont;
    self.name1TF.font =LabelFont;
    self.name2TF.font = LabelFont;
    
    [self.bgView addSubview:self.name1];
    [self.bgView addSubview:self.name1TF];
    [self.bgView addSubview:self.name2];
    [self.bgView addSubview:self.name2TF];
    
    
    
}

- (void)configUISetWithName:(NSString *)name  Name2:(NSString *)name2 {
    self.name1.text = name;
    self.name2.text = name2;
    
    CGSize size1 =  [name getStringSizeWithAtteributes:@{NSFontAttributeName: LabelFont}];
    CGSize size2 = [name2 getStringSizeWithAtteributes:@{NSFontAttributeName: LabelFont}];
    
    [_name1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.mas_equalTo(size1.width);
        make.height.mas_equalTo(@50);
    }];
    
    [_name1TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name1.mas_right).with.offset(5);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self).multipliedBy(0.25);
    }];
    
    [_name2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).with.offset(SCREEN_W/2);
        make.height.mas_equalTo(@50);
        make.top.equalTo(self).offset(0);
        make.width.mas_equalTo(size2.width);
        
    }];
    
    [_name2TF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_name2.mas_right).with.offset(5);
        make.height.mas_equalTo(@44);
        make.top.equalTo(self).offset(3);
        make.width.mas_offset(@50);
        
    }];

}
@end
