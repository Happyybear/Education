//
//  ManageSchoolCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManageSchoolModel.h"
@interface ManageSchoolCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *SchoolName;
@property (weak, nonatomic) IBOutlet UILabel *StudentCount;
@property (weak, nonatomic) IBOutlet UILabel *buildDate;
@property (weak, nonatomic) IBOutlet UILabel *headMaster;
@property (weak, nonatomic) IBOutlet UIButton *manageButton;
@property (nonatomic,copy) void (^cellClick)(NSString* p_id);
- (void)refreshUI:(ManageSchoolModel *)model;
@end
