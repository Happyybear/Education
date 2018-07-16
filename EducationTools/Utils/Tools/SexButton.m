//
//  SexButton.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "SexButton.h"
#define m_width 20
@implementation SexButton

+ (UIButton *)m_buttonWithType:(UIButtonType)buttonType{
    
    UIButton * button = [UIButton buttonWithType:buttonType];
    [button setImage:[UIImage imageNamed:@"checkbox_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"05-2登录_10"] forState:UIControlStateSelected];
    
    return button;
}
    

- (void)layoutSubviews{
    
    [self setImage:[UIImage imageNamed:@"planNormal"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"planSelect"] forState:UIControlStateSelected];
    

    [super layoutSubviews];
    
    self.titleLabel.font = [UIFont systemFontOfSize:9];
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.titleLabel.frame = CGRectMake(0,1, self.frame.size.width - m_width-5, self.frame.size.height);
    
    self.backgroundColor = [UIColor whiteColor];
    CGFloat h = (self.frame.size.height - m_width)/2;
    self.imageView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame),h, m_width, m_width);
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    return hitView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
