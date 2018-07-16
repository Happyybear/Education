//
//  PersonalCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"

@protocol cellClick<NSObject>
- (void)mangeClick:(NSString *)m_id;
- (void)deleteClick:(NSString *)m_id;
@end

@interface PersonalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameTF;
@property (weak, nonatomic) IBOutlet UILabel *classTF;

- (void)setCell:(PersonModel *)model;

@property (nonatomic,assign) id <cellClick> delegate;

@end
