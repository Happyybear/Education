//
//  NameCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
@interface NameCell : BaseCell

@property (nonatomic, strong) UIView * BgView;

@property (nonatomic,strong) UILabel * name;

@property (nonatomic,strong) UITextField * nameTF;

@property (nonatomic,strong) UILabel * sex;


@end
