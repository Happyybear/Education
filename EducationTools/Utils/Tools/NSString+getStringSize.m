//
//  NSString+getStringSize.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/9.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "NSString+getStringSize.h"

@implementation NSString (getStringSize)

-(CGSize)getStringSizeWithAtteributes:(NSDictionary *)set{
    //计算文本文字size
    CGSize size;
    if (set) {
        size = [self sizeWithAttributes:set];
    }else{
        size = [self sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f]}];
    }
    
    //获取宽高
    
    CGSize statuseStrSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    //打印宽高
    return statuseStrSize;
//    NSLog(@"%@_width:%f_height:%f",NSStringFromCGSize(statuseStrSize),size.width,size.height);
    
}
@end
