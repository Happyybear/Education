//
//  PassWordCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/6/21.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PassWordCell.h"

@implementation PassWordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/**
 二次配置子类UI
 */
- (void)setConfig{
    self.name.text = @"密码";
    [self.nameTF addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    //为controller传来的模型赋值
    self.contetModel.value1 = self.nameTF.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
