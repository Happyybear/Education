//
//  BrithView.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@interface BrithView : BaseView

@property (nonatomic,strong) UILabel * name1;

@property (nonatomic,strong) UITextField * name1TF;

@property (nonatomic,strong) UILabel * name2;

@property (nonatomic, strong) UITextField * name2TF;

@property (nonatomic, strong) UIView * bgView;
- (void)configUISetWithName:(NSString *)name  Name2:(NSString *)name2;
@end
