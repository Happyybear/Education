//
//  CharView.h
//  HYSEM
//
//  Created by 王一成 on 2017/8/3.
//  Copyright © 2017年 WGM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HorizontalChart,
    LineChart,
} CHART_STYLE;

@class DeviceModel;

@interface CharView : UIView

- (id)initWithFrame:(CGRect)frame chartStyle:(CHART_STYLE)style;
-(void)darwStartWith:(NSMutableArray *)data;

@property (nonatomic, retain) NSMutableArray * showData;

@end
