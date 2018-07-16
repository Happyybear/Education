//
//  SchoolStudentModel.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SchoolStudentModel : NSObject

@property (nonatomic, copy) NSString *birthdate;
@property (nonatomic, copy) NSString *m_class;
@property (nonatomic, copy) NSString *classamount;
@property (nonatomic, copy) NSString *earnestpay;
@property (nonatomic, copy) NSString *m_id;
@property (nonatomic, assign) NSInteger learn;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *parent1;
@property (nonatomic, copy) NSString *parent2;
@property (nonatomic, assign) NSInteger paymode;
@property (nonatomic, assign) NSInteger paytype;
@property (nonatomic, copy) NSString *phone1;
@property (nonatomic, copy) NSString *phone2;
@property (nonatomic, copy) NSString *practicalpay;
@property (nonatomic, copy) NSString *school;
@property (nonatomic, copy) NSString *serviceuser;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, copy) NSString *shouldpay;
@property (nonatomic, copy) NSString *surpluspay;

@end
