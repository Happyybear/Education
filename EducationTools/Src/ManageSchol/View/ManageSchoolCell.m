//
//  ManageSchoolCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ManageSchoolCell.h"

@interface ManageSchoolCell()

@property (nonatomic, copy) NSString * school_id;

@end

@implementation ManageSchoolCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.manageButton.layer.cornerRadius = 5;
}
- (IBAction)manageAction:(id)sender {
    self.cellClick(self.school_id);
}
- (void)refreshUI:(ManageSchoolModel *)model{
    self.SchoolName.text = model.name;
    self.headMaster.text = [NSString stringWithFormat:@"校长:%@",model.headmaster];
    self.StudentCount.text = [NSString stringWithFormat:@"学员总数:%@",model.studentcount];
    self.buildDate.text = [NSString stringWithFormat:@"建校日期:%@",model.date];
    self.school_id = model.school_id;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
