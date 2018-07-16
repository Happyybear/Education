//
//  PayButton.m
//  HYSEM
//
//  Created by 王一成 on 2017/11/2.
//  Copyright © 2017年 WGM. All rights reserved.
//

#import "PayButton.h"

@interface PayButton ()


@end

@implementation PayButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(SCREEN_W/4/2-15, 20, 30, 30);
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.frame = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2);

}
//改变图片颜色
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    return hitView;
}
//- (UIImage *)imageWithColor:(UIColor *)color
//{
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
//    CGContextRefcontext = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(context, 0, self.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//    CGContextSetBlendMode(context, kCGBlendModeNormal);
//    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    CGContextClipToMask(context, rect, self.CGImage);
//    [color setFill];
//    CGContextFillRect(context, rect);
//    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}
@end
