//
//  TeacherInfoModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/6/27.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "TeacherInfoModel.h"

@implementation TeacherInfoModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"approve" : @"approve",
             @"birthdate" : @"birthdate",
             @"t_class" : @"class",
             @"disclassbonus" : @"disclassmoney",
             @"t_id" : @"id",
             @"name" : @"name",
             @"nickname" : @"nickname",
             @"phone" : @"phone",
             @"pwd" : @"pwd",
             @"salarybase" : @"salarybase",
             @"school" : @"school",
             @"type" : @"type",
             @"sex" : @"sex",
             @"workagebonus" : @"workagebonus",
             
             };
}
@end
