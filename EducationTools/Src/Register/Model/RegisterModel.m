//
//  RegisterModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/16.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "RegisterModel.h"
#import <YYModel.h>
@implementation RegisterModel

- (instancetype)initWith:(NSString *)name sex:(int)sex birthdate:(NSString *)birthdate school:(NSString *)school phone:(NSString *)phone type:(int)type authcode:(NSString *)authcode pwd:(NSString *)pwd{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.sex = sex;
        self.birthdate = birthdate;
        self.school = school;
        self.phone = phone;
        self.type = type;
        self.authcode = authcode;
        self.pwd = pwd;
    }
    return self;
}
//返回一个 Dict，将 Model 属性名对映射到 JSON 的 Key。
//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"name" : @"n",
//             @"page" : @"p",
//             @"desc" : @"ext.desc",
//             @"bookID" : @[@"id",@"ID",@"book_id"]};
//}

// 如果实现了该方法，则处理过程中会忽略该列表内的所有属性
//+ (NSArray *)modelPropertyBlacklist {
//    return @[@"test1", @"test2"];
//}
//// 如果实现了该方法，则处理过程中不会处理该列表外的属性。
//+ (NSArray *)modelPropertyWhitelist {
//    return @[@"name"];
//}
// 当 JSON 转为 Model 完成后，该方法会被调用。
// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
// 你也可以在这里做一些自动转换不能完成的工作。
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    NSNumber *timestamp = dic[@"timestamp"];
//    if (![timestamp isKindOfClass:[NSNumber class]]) return NO;
//    _createdAt = [NSDate dateWithTimeIntervalSince1970:timestamp.floatValue];
//    return YES;
//}
//
//// 当 Model 转为 JSON 完成后，该方法会被调用。
//// 你可以在这里对数据进行校验，如果校验不通过，可以返回 NO，则该 Model 会被忽略。
//// 你也可以在这里做一些自动转换不能完成的工作。
//- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic {
//    if (!_createdAt) return NO;
//    dic[@"timestamp"] = @(n.timeIntervalSince1970);
//    return YES;
//}
@end
