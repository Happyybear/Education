//
//  CommitView.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseView.h"
@interface CommitView : BaseView
@property (copy, nonatomic) void (^commmit)(void);
@property (nonatomic,copy) NSString *titleName;
@end
