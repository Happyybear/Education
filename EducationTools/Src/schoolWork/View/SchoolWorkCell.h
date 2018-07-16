//
//  SchoolWorkCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassModel.h"
@interface SchoolWorkCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *className;
@property (weak, nonatomic) IBOutlet UILabel *PersonCount;
@property (weak, nonatomic) IBOutlet UILabel *Teacher;
@property (weak, nonatomic) IBOutlet UILabel *Student;
@property (weak, nonatomic) IBOutlet UIButton *manageBtn;
@property (weak, nonatomic) IBOutlet UIButton *endClassBtn;

@property (nonatomic,copy) void (^cellClick)(int type);

- (void)refreshUI:(ClassModel *)classInfo;
@end
