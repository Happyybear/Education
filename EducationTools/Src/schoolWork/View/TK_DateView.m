//
//  TK_DateView.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "TK_DateView.h"

@implementation TK_DateView

- (void)addOtherView{
    
    self.nameTF1 = [[UILabel alloc] init];
    self.nameTF1.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.nameTF2 addGestureRecognizer:tap2];
    
    self.nameTF2 = [[UILabel alloc] init];
    self.nameTF2.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.nameTF2 addGestureRecognizer:tap];
    
    [self.BgView addSubview:self.nameTF1];
    [self.BgView addSubview:self.nameTF2];
}

/**
 tap事件
 */
- (void)tapAction:(UIGestureRecognizer *)tap{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if (tap.view == self.nameTF1) {
        
    }else if (tap.view == self.nameTF2){
        
    }
}



@end
