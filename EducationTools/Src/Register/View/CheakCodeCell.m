//
//  CheakCodeCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "CheakCodeCell.h"

@implementation CheakCodeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setConfig{
    self.name.text = @"验证码";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
