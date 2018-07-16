//
//  PickerViewModle.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    dateSelector,
    schoolSelector,
    classSelector,
    normalText,
} m_selector;
@interface PickerViewModle : UIView

@property (nonatomic,strong) UILabel * name1;

@property (nonatomic,strong) UITextField * nameTF1;

@property (nonatomic, strong) UIView * mbgView;

- (void)configUISetWithName:(NSString *)name inputType:(m_selector)pickerType;
@end
