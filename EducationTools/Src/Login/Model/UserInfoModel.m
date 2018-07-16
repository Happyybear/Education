//
//  UserInfoModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/6/24.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"user_id" : @"id",
             @"token" : @"token",
             @"type" : @"type"};
}
@end
