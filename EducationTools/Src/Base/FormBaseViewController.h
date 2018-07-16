//
//  FormBaseViewController.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseViewController.h"

@interface FormBaseViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong) UITableView * mTableView;

@property (nonatomic,strong) NSMutableArray * dataSource;

- (void)initView;

@end
