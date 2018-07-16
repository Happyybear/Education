//
//  MemberDetailViewController.h
//  EducationTools
// 会员管理详细页面
//  Created by 王一成 on 2018/7/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "FormBaseViewController.h"

@interface MemberDetailViewController : FormBaseViewController
@property (nonatomic, copy) NSString * student_id;
//所有班级数据
@property (nonatomic, strong) NSMutableArray * allclassData;
@end
