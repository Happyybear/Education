//
//  TeacherCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/5.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *attenceButton;
@property (nonatomic,copy) void(^attenceAction)(void);
@end
