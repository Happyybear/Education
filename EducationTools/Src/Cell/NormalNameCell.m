//
//  NormalNameCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "NormalNameCell.h"

@implementation NormalNameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)configView{
    
    self.name = [[UILabel alloc] init];
    self.nameTF = [[UITextField alloc] init];
    self.name.font = LabelFont;
    self.name.text = @"姓名:";
    
    [self.contentView addSubview:self.nameTF];
    [self.contentView addSubview:self.name];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.width.equalTo(self.contentView).multipliedBy(0.2);
        make.height.mas_equalTo(@50);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).with.offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self.contentView).multipliedBy(0.8);
    }];
    
    //监听text的输入
    [self.nameTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)textFieldDidChange :(UITextField *)theTextField{
    self.contetModel.value1 = self.nameTF.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    // 当前控件上的点转换到chatView上
    CGPoint pot = [self convertPoint:point toView:self.contentView];
    
    // 判断下点在不在chatView上
    if ([self.nameTF pointInside:pot withEvent:event]) {
        return self.nameTF;
    }else{
        return [super hitTest:point withEvent:event];
    }
    
    
    return nil;
}
@end
