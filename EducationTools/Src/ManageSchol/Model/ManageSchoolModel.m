//
//  ManageSchoolModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ManageSchoolModel.h"

@implementation ManageSchoolModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"school_id" : @"id",
             };
}
@end
