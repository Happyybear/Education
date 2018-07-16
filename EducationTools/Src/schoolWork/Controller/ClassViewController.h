//
//  ClassViewController.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "FormBaseViewController.h"

@interface ClassViewController : FormBaseViewController

@property (nonatomic, copy) NSString * class_id;
//所有班级数据
@property (nonatomic, strong) NSMutableArray * allclassData;

@end
