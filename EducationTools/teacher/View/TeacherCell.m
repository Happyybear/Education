//
//  TeacherCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/5.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "TeacherCell.h"

@implementation TeacherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.attenceButton.layer.cornerRadius = 5;
}
- (IBAction)attenceClick:(UIButton *)sender {
    self.attenceAction();
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
