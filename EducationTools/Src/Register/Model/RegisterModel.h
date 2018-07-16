//
//  RegisterModel.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/16.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterModel : NSObject

/**
 真实姓名
 */
@property (nonatomic, copy) NSString * name;

/**
 0:女; 1:男
 */
@property (nonatomic, assign) int sex;

/**
 密码
 */
@property (nonatomic, copy) NSString * pwd;

/**
 1:分校校长; 2:教师
 */
@property (nonatomic, assign) int type;

/**
 验证码
 */
@property (nonatomic, copy) NSString * authcode;

/**
     手机号
 */
@property (nonatomic, copy) NSString * phone;

/**
 学校
 */
@property (nonatomic, copy) NSString * school;
/**
 例如:1990-02-23
 */
@property (nonatomic, copy) NSString * birthdate;

- (instancetype)initWith:(NSString *)name sex:(int)sex birthdate:(NSString *)birthdate school:(NSString *)school phone:(NSString *)phone type:(int)type authcode:(NSString *)authcode pwd:(NSString *)pwd;
@end
