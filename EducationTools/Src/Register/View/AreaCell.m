//
//  AreaCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "AreaCell.h"
#import <BRPickerView.h>
#import "SchoolModel.h"

@interface AreaCell()

@property (nonatomic,strong) NSMutableArray * dataSource;

@end
@implementation AreaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setConfig{
    [self s_setConfig];
}

- (void)s_setConfig{
    
    [self.nameTF setEnabled:NO];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    
    [self.nameTF addGestureRecognizer:tap];
}

/**
 tap事件
 */
- (void)tapAction{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self getSchool];
    //    __weak typeof(self) weakSelf = self;
    //    [BRStringPickerView showStringPickerWithTitle:@"校区" dataSource:@[@"分校校长", @"教师"] defaultSelValue:@"分校校长" resultBlock:^(id selectValue) {
    //        weakSelf.nameTF.text = selectValue;
    //        weakSelf.contetModel.value1 = selectValue;
    //    }];
}
/**
 获取学校
 */
-(void)getSchool{
    
    NSMutableDictionary * dict = [NSMutableDictionary new];
    [dict setObject:@1 forKey:@"mode"];
    
    NSData * data = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    [[ZBNetworking shaerdInstance]uploadJsonDataWithUrl:QSchool jsonData:data fileName:@"jsondata" progressBlock:^(int64_t bytesWritten, int64_t totalBytes) {
        
    } successBlock:^(id response) {
        NSLog(@"%@",response);
        if ([[response objectForKey:@"result"] intValue] == 0) {
            NSArray * arr = [response objectForKey:@"jsondata"];
            NSMutableArray * ui = [[NSMutableArray alloc] init];
            for (NSDictionary * dict in arr) {
                DLog(@"%@",[dict objectForKey:@"name"]);
                SchoolModel * model = [SchoolModel yy_modelWithDictionary:dict];
                [self.dataSource addObject:model];
                [ui addObject:model.name];
            }
            
            __weak typeof(self) weakSelf = self;
            [BRStringPickerView showStringPickerWithTitle:@"校区" dataSource:ui defaultSelValue:[ui firstObject] resultBlock:^(id selectValue) {
                weakSelf.nameTF.text = selectValue;
                
                NSInteger index = [ui indexOfObject:selectValue];
                SchoolModel * sc = self.dataSource[index];
                
                weakSelf.contetModel.value1 = sc.schoolID;
            }];
            
        }
       
    } failBlock:^(NSError *error) {
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - **************** getSet
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}
@end
