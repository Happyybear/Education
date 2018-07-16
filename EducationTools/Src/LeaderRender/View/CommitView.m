//
//  CommitView.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "CommitView.h"

@interface CommitView()

@property (nonatomic,strong)UIButton * commitButton;
@end

@implementation CommitView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(UIButton *)commitButton{
    
    if (!_commitButton) {
        _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commitButton.frame = CGRectMake(0, 0, 150, 44);
        _commitButton.center = self.center;
        _commitButton.backgroundColor = RGB(1, 189, 242);
        _commitButton.layer.cornerRadius = 5;
        [_commitButton addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitButton;
}

- (void)commit{
    self.commmit();
}

- (void)setTitleName:(NSString *)titleName
{
    [self.commitButton setTitle:titleName forState:UIControlStateNormal];
}

- (void)setupUI {
    
    UIView *bgView = [FactoryUI createViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    bgView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:self.commitButton];
    [self addSubview:bgView];
    
}

@end
