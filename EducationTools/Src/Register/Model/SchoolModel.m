//
//  SchoolModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/6/22.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "SchoolModel.h"

@implementation SchoolModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"name",
             @"addr" : @"addr",
             @"schoolID" : @"id"};
}
@end
