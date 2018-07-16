//
//  BaseCell.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UITableViewCell<UITextFieldDelegate>
- (void)configView;
- (void)setConfig;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void)setCellWith:(ContentModel *)model;
- (void)refreshCell;
@property (nonatomic,strong) ContentModel * contetModel;
@end
