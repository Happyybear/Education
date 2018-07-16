//
//  PersonalCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PersonalCell.h"

@interface PersonalCell()

@property (nonatomic, copy) NSString * m_id;

@end

@implementation PersonalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}
- (IBAction)manageAction:(id)sender {
    [self.delegate mangeClick:_m_id];
}
- (IBAction)deleteAction:(id)sender {
    [self.delegate deleteClick:_m_id];
}

- (void)setCell:(PersonModel *)model{
    self.nameTF.text = model.name;
    self.classTF.text = model.m_class;
    _m_id = model.m_id;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
