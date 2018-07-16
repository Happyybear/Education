//
//  TwoTextField.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface TwoTextField : BaseView

@property (nonatomic, strong) UIView * BgView;

@property (nonatomic,strong) UILabel * name1;

@property (nonatomic,strong) UITextField * nameTF1;

@property (nonatomic,strong) UILabel * name2;

@property (nonatomic,strong) UITextField * nameTF2;

- (void)configUISetWithName:(NSString *)name Name2:(NSString *)name2;

- (void)addOtherView;

@end
