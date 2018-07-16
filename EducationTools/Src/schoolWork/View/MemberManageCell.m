//
//  MemberManageCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "MemberManageCell.h"

@interface MemberManageCell ()

@property (nonatomic, copy) NSString * s_id;

@end

@implementation MemberManageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bmBtn.layer.cornerRadius = 5;
    self.dqBtn.layer.cornerRadius = 5;
    self.tkBtn.layer.cornerRadius = 5;
    
    self.bmBtn.backgroundColor = RGB(32, 193, 240);
    self.dqBtn.backgroundColor = RGB(32, 193, 240);
    self.tkBtn.backgroundColor = RGB(32, 193, 240);
}
- (IBAction)bmAction:(id)sender {
    self.cellClick(0,self.s_id);
}
- (IBAction)getTimeAction:(id)sender {
    self.cellClick(1,self.s_id);
}
- (IBAction)rebackMoney:(id)sender {
    self.cellClick(2,self.s_id);
}
- (IBAction)selectedClassAction:(id)sender {
    self.cellClick(3,self.s_id);
}

- (void)refreshUI:(ClassInfoModel *)model{
    self.nameLabel.text = [NSString stringWithFormat:@"姓名:%@",model.name];
    self.classLabel.text = [NSString stringWithFormat:@"班级:%@",model.m_class];
    self.timeLabel.text = [NSString stringWithFormat:@"缴费日期:%@",model.paydate];
    self.s_id = model.m_id;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
