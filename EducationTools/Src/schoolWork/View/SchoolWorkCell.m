//
//  SchoolWorkCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "SchoolWorkCell.h"

@implementation SchoolWorkCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.manageBtn.layer.cornerRadius = 5;
    self.endClassBtn.layer.cornerRadius = 5;
}
- (IBAction)manageAction:(id)sender {
    self.cellClick(0);
}
- (IBAction)endClassAction:(id)sender {
    self.cellClick(1);
}

- (void)refreshUI:(ClassModel *)classInfo{
    if (classInfo.isRun == NO) {
        self.className.text = @"为分班学员";
    }else{
        self.className.text = classInfo.name;
    }
    if (!classInfo.studentcount) {
        self.PersonCount.text = [NSString stringWithFormat:@"人数:"];
    }else{
        self.PersonCount.text = [NSString stringWithFormat:@"人数:%@",classInfo.studentcount];
    }
    self.Student.text = [NSString stringWithFormat:@"任课教师:%@",classInfo.teacher];
    self.Teacher.text = [NSString stringWithFormat:@"开班时间:%@",classInfo.startclass];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
