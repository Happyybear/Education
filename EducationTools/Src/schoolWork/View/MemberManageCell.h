//
//  MemberManageCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassInfoModel.h"
@interface MemberManageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//@property (weak, nonatomic) IBOutlet UIButton *bmBtn;
@property (weak, nonatomic) IBOutlet UIButton *dqBtn;
//@property (weak, nonatomic) IBOutlet UIButton *tkBtn;
@property (weak, nonatomic) IBOutlet UIButton *bmBtn;
@property (weak, nonatomic) IBOutlet UIButton *tkBtn;
@property (nonatomic,copy) void (^cellClick)(int type,NSString * s_id);//012,3为选择班级

- (void)refreshUI:(ClassInfoModel *)model;
@end
