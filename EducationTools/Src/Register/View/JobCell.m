//
//  JobCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "JobCell.h"
#import <BRPickerView.h>
@implementation JobCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setConfig{
    [self s_setConfig];
}

- (void)s_setConfig{
    
    [self.nameTF setEnabled:NO];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.nameTF addGestureRecognizer:tap];
}

- (void)tapAction{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    __weak typeof(self) weakSelf = self;
    NSMutableArray * temp = [NSMutableArray new];
    [temp addObject:@"分校校长"];
    [temp addObject:@"教师"];
    
    [BRStringPickerView showStringPickerWithTitle:@"职位"  dataSource:temp defaultSelValue:[temp firstObject] resultBlock:^(id selectValue) {
        weakSelf.nameTF.text = selectValue;
        weakSelf.contetModel.value1 = [NSString stringWithFormat:@"%ld",[temp indexOfObject:selectValue]+1 ];
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    // 当前控件上的点转换到chatView上
    CGPoint pot = [self convertPoint:point toView:self.contentView];
    
    // 判断下点在不在chatView上
    if ([self.nameTF pointInside:pot withEvent:event]) {
        return self.nameTF;
    }else{
        return [super hitTest:point withEvent:event];
    }
    
    
    return nil;
}
@end
