//
//  TeacherInfoModel.h
//  EducationTools
//
//  Created by 王一成 on 2018/6/27.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeacherInfoModel : NSObject
@property (nonatomic, copy) NSString * approve;
@property (nonatomic, copy) NSString * birthdate;
@property (nonatomic, copy) NSString * t_class;
@property (nonatomic, copy) NSString * disclassbonus;
@property (nonatomic, copy) NSString * t_id;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * nickname;
@property (nonatomic, copy) NSString * phone;
@property (nonatomic, copy) NSString * pwd;
@property (nonatomic, copy) NSString * salarybase;
@property (nonatomic, copy) NSString * school;
@property (nonatomic, assign) int sex;
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString * workagebonus;

//birthdate = "1992-11-05";
//class = "";
//disclassbonus = "0.00";
//id = "0712bc8d-1f06-477b-afb3-407d4ed85dd1";
//name = "\U8001\U987d\U7ae5";
//nickname = "";
//phone = 15665800480;
//pwd = 123456;
//salarybase = "0.00";
//school = "\U5386\U4e0b\U533a\U5e0c\U671b\U8865\U4e60\U73ed";
//sex = 0;
//type = 2;
//workagebonus = "0.00";
@end
