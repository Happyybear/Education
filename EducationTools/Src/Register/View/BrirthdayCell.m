//
//  BrirthdayCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "BrirthdayCell.h"
#import "PGDatePickManager.h"
#import "ControllersTools.h"

@interface BrirthdayCell ()<PGDatePickerDelegate>

@property (nonatomic,strong) NSDate * currentDate;

@end

@implementation BrirthdayCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configView{
    
    self.name = [[UILabel alloc] init];
    self.name.font = LabelFont;
    
    self.nameTF = [[UILabel alloc] init];
//    [self.nameTF setEnabled:NO];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.nameTF addGestureRecognizer:tap];
    
    self.name.text = @"出生日期:";
    
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.nameTF];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.width.equalTo(self.contentView).multipliedBy(0.2);
        make.height.mas_equalTo(@50);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(50);
        make.right.equalTo(self.contentView).offset(10);
    }];
}

- (void)tapAction{
    [_nameTF becomeFirstResponder];
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    datePickManager.isShadeBackgroud = true;
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.delegate = self;
    datePicker.datePickerType = PGPickerViewType2;
    datePicker.isHiddenMiddleText = false;
    datePicker.datePickerMode = PGDatePickerModeDate;
    
    datePicker.minimumDate = [NSDate setYear:1900 month:1 day:1];
    datePicker.maximumDate = [NSDate setYear:2027 month:10 day:2];
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
//    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
//    NSDate *date = [dateFormatter dateFromString: @"2019-08-10 05:04"];
    [datePicker setDate:self.currentDate animated:true];
    

    [self.mcontrol presentViewController:datePickManager animated:false completion:nil];
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

- (void)setCellWith:(ContentModel *)model{
    self.contetModel = model;
    
}
#pragma PGDatePickerDelegate
- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    NSLog(@"dateComponents = %@", dateComponents);
    [self.nameTF setText:[NSString stringWithFormat:@"%04ld-%02ld-%02ld",dateComponents.year,dateComponents.month,dateComponents.day]];
    
    self.contetModel.value1 = self.nameTF.text;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    self.currentDate = [gregorian dateFromComponents:dateComponents];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (NSDate *)currentDate{
    if (!_currentDate) {
        _currentDate = [NSDate date];
    }
    return _currentDate;
}

@end
