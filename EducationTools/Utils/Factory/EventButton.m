//
//  EventButton.m
//  HYSEM
//
//  Created by 王一成 on 2017/11/8.
//  Copyright © 2017年 WGM. All rights reserved.
//

#import "EventButton.h"

#define imageH  18
#define titleH  21

@implementation EventButton


- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(5,self.frame.size.height/2-(imageH/2), imageH, imageH);
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.frame = CGRectMake(5+25, self.frame.size.height/2-titleH/2, self.frame.size.width - CGRectGetMaxX(self.imageView.frame)-10, titleH);
    
}
@end
