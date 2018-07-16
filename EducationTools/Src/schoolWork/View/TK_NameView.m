//
//  TK_NameView.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/7.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "TK_NameView.h"
#import <BRStringPickerView.h>
#import "ClassModel.h"
@interface TK_NameView()
@property (nonatomic, strong) NSMutableArray * classData;
@end

@implementation TK_NameView

- (void)addOtherView{
    self.nameTF2 = [[UILabel alloc] init];
    self.nameTF2.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
//    [self.nameTF2 addGestureRecognizer:tap];
    [self addSubview:self.nameTF2];
}

/**
 tap事件
 */
- (void)tapAction{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self getClass];
}

- (void)getClass{
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:@1 forKey:@"mode"];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    @WeakObj(self);
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:QClass jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        if ([[response objectForKey:@"result"] intValue] == 0) {
            
            _classData = [[NSMutableArray alloc] init];
            //获取校区成功
            NSArray * arr = [response objectForKey:@"jsondata"];
            NSMutableArray * ui = [[NSMutableArray alloc] init];
            for (NSDictionary * dict in arr) {
                DLog(@"%@",[dict objectForKey:@"name"]);
                ClassModel * model = [ClassModel yy_modelWithDictionary:dict];
                [_classData addObject:model];
                [ui addObject:model.name];
            }
            
            __weak typeof(self) weakSelf = self;
            [BRStringPickerView showStringPickerWithTitle:@"班级" dataSource:ui defaultSelValue:[ui firstObject] resultBlock:^(id selectValue) {
                weakSelf.nameTF2.text = selectValue;
                
                NSInteger index = [ui indexOfObject:selectValue];
                ClassModel * model = _classData[index];
                selfWeak.selectedItemID = model.class_id;
            }];
        }else{
            
        }
    } failBlock:^(NSError *error) {
        
    }];
}

- (NSMutableArray *)classData{
    if (!_classData) {
        _classData = [[NSMutableArray alloc] init];
    }
    return _classData;
}
@end
