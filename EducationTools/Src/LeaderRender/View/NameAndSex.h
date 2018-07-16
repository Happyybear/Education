//
//  NameAndSex.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface NameAndSex : BaseView

@property (nonatomic,strong) UIButton * women;

@property (nonatomic,strong) UIButton * men;

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic,strong) UILabel * name;

@property (nonatomic,strong) UITextField * nameTF;

@property (nonatomic,strong) UILabel * sex;

- (void)configUISetWithName:(NSString *)name textfiled:(NSString *)teName Name2:(NSString *)name2 Button:(NSString *)btn1 Button:(NSString *)btn2;
@end
