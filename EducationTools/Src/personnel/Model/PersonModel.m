//
//  PersonModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/6/27.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"name",
             @"m_id" : @"id",
             @"m_class" : @"class",
            };
}
@end
