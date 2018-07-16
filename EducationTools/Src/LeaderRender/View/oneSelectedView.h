//
//  oneSelectedView.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "OneTextfiled.h"
typedef void(^getBack)(id object);
typedef enum {
    timeDate = 0,
    data
}PickType;

@interface oneSelectedView : OneTextfiled
@property (nonatomic,strong) NSMutableArray *pickData;
@property (nonatomic,copy) getBack m_reslut;
- (void)configPicker:(NSMutableArray *)picktData type:(PickType)type resut:(getBack)result;

@end
