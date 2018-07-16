//
//  PayNumView.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface PayNumView : BaseView

@property (nonatomic,strong) UIButton * btnA;

@property (nonatomic,strong) UIButton * btnB;

@property (nonatomic,strong) UIButton * btnC;


@property (nonatomic,strong) UILabel * name;

@property (nonatomic,strong) UITextField * nameTF;

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, copy) NSString * seleceItem;

- (void)configUISetWithName:(NSString *)name inputType:(UIKeyboardType)keybooard Name2:(NSString *)name2 Button1:(NSString *)btn1 Button2:(NSString *)btn2 Button3:(NSString *)btn3;

@end
