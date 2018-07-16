//
//  PayPursh.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoSeletorModel.h"
#import "BaseView.h"
@interface PayPursh : BaseView
@property (nonatomic,strong)PhotoSeletorModel* model;
@property (copy, nonatomic) void (^photoViewChangeHeightBlock)(void);
@property (copy, nonatomic) NSString * photoUrl;
@property (copy, nonatomic) NSString * photoName;
@property (copy, nonatomic) NSString * photoType;
- (void)refreshUI;
@end
