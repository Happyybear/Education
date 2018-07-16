//
//  PayMethodView.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface PayMethodView : BaseView


@property (nonatomic,strong) UIButton * weichat;

@property (nonatomic,strong) UIButton * alipay;

@property (nonatomic,strong) UIButton * carsh;

@property (nonatomic,strong) UIButton * card;


@property (nonatomic,strong) UILabel * name;

@property (nonatomic, strong) UIView * bgView;


- (void)configUISetWithName:(NSString *)name Button1:(NSString *)btn1 Button2:(NSString *)btn2 Button3:(NSString *)btn3 Button4:(NSString *)btn4;
@end
