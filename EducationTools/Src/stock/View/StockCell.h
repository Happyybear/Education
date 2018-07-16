//
//  StockCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
@interface StockCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
@property (weak, nonatomic) IBOutlet UILabel *goodsCount;

@property (weak, nonatomic) IBOutlet UITextField *goodsCountTF;
@property (weak, nonatomic) IBOutlet UITextField *purposeTF;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (nonatomic, copy) void(^stock)(NSString *purpose,int count);
- (void)refreshUI:(GoodsModel *)good;
@end
