//
//  AttenceCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/5.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "AttenceCell.h"

@implementation AttenceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.name.adjustsFontSizeToFitWidth = YES;
    self.InTime.adjustsFontSizeToFitWidth = YES;
    self.NoInTime.adjustsFontSizeToFitWidth = YES;
    self.btnA.layer.cornerRadius = 5;
    self.btnB.layer.cornerRadius = 5;
    self.btnC.layer.cornerRadius = 5;
    self.btnD.layer.cornerRadius = 5;
    self.btnA.backgroundColor = RGB(42, 191, 240) ;
    self.btnB.backgroundColor = RGB(241, 181, 43) ;
    self.btnC.backgroundColor = RGB(239, 91, 40) ;
    self.btnD.backgroundColor = RGB(148, 148, 150) ;
    // Initialization code
}
- (IBAction)kaoQingAction:(id)sender {
}
- (IBAction)qJiaACtion:(id)sender {
}
- (IBAction)jieKeAction:(id)sender {
}
- (IBAction)rebackFeeAction:(id)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
