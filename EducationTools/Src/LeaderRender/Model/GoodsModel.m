//
//  GoodsModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"name",
             @"good_id" : @"id",
             };
}


@end
