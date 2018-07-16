//
//  AttenceCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/7/5.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttenceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateTime;
@property (weak, nonatomic) IBOutlet UILabel *NoInTime;
@property (weak, nonatomic) IBOutlet UILabel *InTime;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *btnA;
@property (weak, nonatomic) IBOutlet UIButton *btnB;
@property (weak, nonatomic) IBOutlet UIButton *btnC;
@property (weak, nonatomic) IBOutlet UIButton *btnD;
@property (nonatomic,strong) NSMutableArray * selectItem;
@property (nonatomic,copy) void(^clickAction)(void);
@property (nonatomic,copy) void(^selectAction)(void);
@end
