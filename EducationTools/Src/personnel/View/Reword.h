//
//  Reword.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/1.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseView.h"

@interface Reword : BaseView

@property (nonatomic,strong) UIButton * buttonA;

@property (nonatomic,strong) UIButton * buttonB;

@property (nonatomic,strong) UIButton * buttonC;

@property (nonatomic,strong) UIButton * buttonD;

@property (nonatomic,strong) UIButton * buttonE;

@property (nonatomic,strong) UILabel * name;

@property (nonatomic, strong) UIView * bgView;

- (void)configUISetWithName:(NSString *)name Button1:(NSString *)btn1 Button2:(NSString *)btn2 Button3:(NSString *)btn3 Button4:(NSString *)btn4 Button5:(NSString *)button5;
@end
