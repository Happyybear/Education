//
//  NormalNameCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseCell.h"

@interface NormalNameCell : BaseCell
@property (nonatomic, strong) UIView * BgView;

@property (nonatomic,strong) UILabel * name;

@property (nonatomic,strong) UITextField * nameTF;

@end
