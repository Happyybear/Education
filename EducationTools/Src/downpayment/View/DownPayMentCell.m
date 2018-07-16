//
//  DownPayMentCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/11.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "DownPayMentCell.h"

@implementation DownPayMentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.action1.layer.cornerRadius = 5;
    self.action2.layer.cornerRadius = 5;
    self.action3.layer.cornerRadius = 5;
}
- (IBAction)actionA:(id)sender {
    [self.delegate mangeClick:@"" type:0];
}
- (IBAction)actionB:(id)sender {
    [self.delegate mangeClick:@"" type:1];
}
- (IBAction)actionC:(id)sender {
    [self.delegate mangeClick:@"" type:2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
