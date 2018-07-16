//
//  BaseTableView.m
//  EducationTools
//
//  Created by 王一成 on 2018/4/26.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        if(@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            //        self.contentInsetAdjustmentBehavior= .never
            self.estimatedRowHeight=0;
            self.estimatedSectionHeaderHeight=0;
            self.estimatedSectionFooterHeight=0;
        }else{
            
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        if(@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            //        self.contentInsetAdjustmentBehavior= .never
            self.estimatedRowHeight=0;
            self.estimatedSectionHeaderHeight=0;
            self.estimatedSectionFooterHeight=0;
        }else{
            
        }
    }
    return self;
}


@end
