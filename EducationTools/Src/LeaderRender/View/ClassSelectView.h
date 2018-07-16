//
//  ClassSelectView.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/4.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseView.h"

@interface ClassSelectView : BaseView

@property (nonatomic,strong) UIButton * women;

@property (nonatomic,strong) UIButton * men;

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic,strong) UILabel * name;

@property (nonatomic,strong) UILabel * nameTF;

@property (nonatomic,strong) UILabel * sex;

@property (nonatomic,copy) NSString *selectedItemID;

- (void)configUISetWithName:(NSString *)name textfiled:(NSString *)teName Name2:(NSString *)name2 Button:(NSString *)btn1 Button:(NSString *)btn2;
@end
