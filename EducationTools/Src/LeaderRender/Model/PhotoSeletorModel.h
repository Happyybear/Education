//
//  PhotoSeletorModel.h
//  EducationTools
//
//  Created by 王一成 on 2018/5/9.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoSeletorModel : NSObject

@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) CGFloat photoViewHeight;
@property (copy, nonatomic) NSArray *photoUrls;


@property (strong, nonatomic) NSMutableArray *endCameraList;
@property (strong, nonatomic) NSMutableArray *endCameraPhotos;
@property (strong, nonatomic) NSMutableArray *endCameraVideos;
@property (strong, nonatomic) NSMutableArray *endSelectedCameraList;
@property (strong, nonatomic) NSMutableArray *endSelectedCameraPhotos;
@property (strong, nonatomic) NSMutableArray *endSelectedCameraVideos;
@property (strong, nonatomic) NSMutableArray *endSelectedList;
@property (strong, nonatomic) NSMutableArray *endSelectedPhotos;
@property (strong, nonatomic) NSMutableArray *endSelectedVideos;
//------//
@property (strong, nonatomic) NSMutableArray *iCloudUploadArray;

@end
