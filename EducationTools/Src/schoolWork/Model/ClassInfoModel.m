//
//  ClassModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ClassInfoModel.h"

@implementation ClassInfoModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"m_class" : @"class",
             @"m_id" : @"id",
             };
}
@end
