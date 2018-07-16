//
//  RemarkView.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "RemarkView.h"

@interface RemarkView()

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UIView *view;

@end
@implementation RemarkView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 40, SCREEN_W-20, self.frame.size.height-45)];
        _textView.backgroundColor = RGB(235, 235, 244);
        _textView.font = LabelFont;
    }
    return _textView;
}

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
        _title.text = @"备注";
        _title.font = LabelFont;
    }
    return _title;
}

- (void)setupUI {
    
    self.view = [FactoryUI createViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.view];
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.title];
}

@end
