//
//  ClassModel.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/4.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseView.h"

@interface ClassModel : BaseView
@property (nonatomic, copy)NSString * class_id;
@property (nonatomic, copy)NSString * name;
@property (nonatomic, copy)NSString * startclass;
@property (nonatomic, copy)NSString * studentcount;
@property (nonatomic, copy)NSString * teacher;
@property (nonatomic, assign)BOOL  isRun;
@end
