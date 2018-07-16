//
//  PhotoSeletorModel.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/9.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PhotoSeletorModel.h"

@implementation PhotoSeletorModel

- (CGFloat)cellHeight {
    _cellHeight = self.photoViewHeight;
    return _cellHeight;
}
- (CGFloat)photoViewHeight {
    if (_photoViewHeight == 0) {
        _photoViewHeight = (([UIScreen mainScreen].bounds.size.width - 24) - 3 * (3 - 1)) / 3;
    }
    return _photoViewHeight;
}

@end
