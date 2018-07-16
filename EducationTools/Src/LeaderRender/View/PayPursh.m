//
//  PayPursh.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PayPursh.h"
#import <HXPhotoView.h>
#import <HXPhotoManager.h>
@interface PayPursh()<HXPhotoViewDelegate>
/**  照片管理  */
@property (nonatomic, strong) HXPhotoManager *manager;
/**  照片视图  */
@property (nonatomic, strong) HXPhotoView *photoView;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UIView *view;
@end

@implementation PayPursh

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    self.view = [FactoryUI createViewWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.view];
    
    [self.view addSubview:self.photoView];
    [self.view addSubview:self.title];
}

- (void)refreshUI{
    self.view.frame = self.frame;
}

- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    
    HXPhotoModel * d = photos.firstObject;
    if (d) {
        self.photoUrl = d.fileURL;
        NSMutableString * filePath = [NSMutableString stringWithFormat:@"%@",d.fileURL];
        
        NSArray * arr = [filePath componentsSeparatedByString:@"///"];
        NSString * path = [arr lastObject];
        
        NSArray *nameArr = [path componentsSeparatedByString:@"."];
        NSString * type = [nameArr lastObject];
        
        NSArray * temp = [[nameArr firstObject] componentsSeparatedByString:@"/"];
        
        NSString * name = [temp lastObject];
        
        self.photoName = name;
        self.photoUrl = path;
        self.photoType = type;
    }
//    self.model.endCameraList = self.manager.afterCameraArray.mutableCopy;
//    self.model.endCameraPhotos = self.manager.afterCameraPhotoArray.mutableCopy;
//    self.model.endCameraVideos = self.manager.afterCameraVideoArray.mutableCopy;
//    self.model.endSelectedCameraList = self.manager.afterSelectedCameraArray.mutableCopy;
//    self.model.endSelectedCameraPhotos = self.manager.afterSelectedCameraPhotoArray.mutableCopy;
//    self.model.endSelectedCameraVideos = self.manager.afterSelectedCameraVideoArray.mutableCopy;
//    self.model.endSelectedList = self.manager.afterSelectedArray.mutableCopy;
    self.model.endSelectedPhotos = self.manager.afterSelectedPhotoArray.mutableCopy;
//    self.model.endSelectedVideos = self.manager.afterSelectedVideoArray.mutableCopy;
//    self.model.iCloudUploadArray = self.manager.afterICloudUploadArray.mutableCopy;
    
    
}
- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame {
    if (frame.size.height == self.model.photoViewHeight) {
        return;
    }
    
    self.model.photoViewHeight = frame.size.height;
    if (self.photoViewChangeHeightBlock) {
        self.photoViewChangeHeightBlock();
        self.view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
}
- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
    }
    return _manager;
}
- (HXPhotoView *)photoView {
    if (!_photoView) {
        _photoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(12, 40, [UIScreen mainScreen].bounds.size.width - 24, 0) WithManager:self.manager];
        _photoView.backgroundColor = [UIColor whiteColor];
        _photoView.delegate = self;
    }
    return _photoView;
}

-(UILabel *)title{
    if (!_title) {
        _title = [FactoryUI createLabelWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
        _title.text = @"缴费凭证";
        _title.font = LabelFont;;
        _title.font = [UIFont systemFontOfSize:13];
    }
    return _title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
