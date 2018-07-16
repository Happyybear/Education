//
//  ClassModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/4.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"class_id" : @"id",};
}

- (NSString *)studentcount{
    if (!_studentcount) {
        _studentcount = 0;
    }
    return _studentcount;
}

- (NSString *)teacher{
    if (!_teacher) {
        _teacher = @" ";
    }
    return _teacher;
}

- (NSString *)startclass{
    if (!_startclass) {
        _startclass = @" ";
    }
    return _startclass;
}
@end
