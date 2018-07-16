//
//  PaypurshView.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseView.h"

@interface PaypurshView : BaseView

@property (nonatomic, strong) NSMutableArray * selectedItem;
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic,strong) UILabel * name;
- (void)configView:(NSArray *)buttonArr title:(NSString *)title;
@end
