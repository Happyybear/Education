//
//  DownPayMentCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/11.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol cellClick<NSObject>
- (void)mangeClick:(NSString *)m_id type:(int)type;
@end

@interface DownPayMentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *m_class;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UIButton *action1;
@property (weak, nonatomic) IBOutlet UIButton *action3;
@property (weak, nonatomic) IBOutlet UIButton *action2;
@property (nonatomic,assign) id <cellClick> delegate;
@end
