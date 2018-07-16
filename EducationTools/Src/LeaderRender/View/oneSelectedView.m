//
//  oneSelectedView.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "oneSelectedView.h"
#import <BRPickerView.h>
@interface oneSelectedView()

@property (nonatomic, strong) NSMutableArray * dataSource;

@property (nonatomic, assign) PickType type;
@end

@implementation oneSelectedView

- (void)addOtherView{
    self.nameTF1 = [[UILabel alloc] init];
    self.nameTF1.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.nameTF1 addGestureRecognizer:tap];
    [self.bgView addSubview:self.nameTF1];
}
/**
 tap事件
 */
- (void)tapAction{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    switch (self.type) {
        case timeDate:{
//            [[NSDate date]initWithTimeIntervalSinceNow:0]
            __weak typeof(self) weakSelf = self;
            [BRDatePickerView showDatePickerWithTitle:@"时间" dateType:BRDatePickerModeYMD defaultSelValue:nil resultBlock:^(NSString *selectValue) {
                weakSelf.m_reslut(selectValue);
            }];
        }
            break;
        case data:{
            __weak typeof(self) weakSelf = self;
            if (!self.dataSource || self.dataSource.count == 0) {
                [MBProgressHUD showError:@"暂无信息" toView:nil];
            }
            [BRStringPickerView showStringPickerWithTitle:@"选择" dataSource:self.dataSource defaultSelValue:[self.dataSource firstObject] resultBlock:^(id selectValue) {
                
                weakSelf.nameTF1.text = selectValue;
                
                NSInteger index = [weakSelf.dataSource indexOfObject:selectValue];

                weakSelf.m_reslut([NSString stringWithFormat:@"%ld",index]);
            }];
        }
            break;
            
        default:
            break;
    }
}

- (void)configPicker:(NSMutableArray *)picktData type:(PickType)type resut:(getBack)result{
    _m_reslut = result;
    self.dataSource = picktData;
    self.type = type;
}
@end
