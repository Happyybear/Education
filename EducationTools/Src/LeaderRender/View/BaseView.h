//
//  BaseView.h
//  EducationTools
//
//  Created by 王一成 on 2018/6/21.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentModel.h"
@interface BaseView : UIView

/**
 数据源
 */
@property (nonatomic,strong) ContentModel * contentModel;

@end
