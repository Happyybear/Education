//
//  TwoTextFiledCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "TwoTextFiledCell.h"

@implementation TwoTextFiledCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configView{
    
    //    _BgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    //    _BgView.backgroundColor = RGB(230, 253, 253);
    //
    //    [self.contentView addSubview:_BgView];
    
    self.name1 = [[UILabel alloc] init];
    self.nameTF1 = [[UITextField alloc] init];
    self.name2 = [[UILabel alloc] init];
    self.nameTF2 = [[UITextField alloc] init];
    self.name1.text = @"name1";
    self.name2.text = @"name2";
    
    [self.contentView addSubview:self.nameTF1];
    [self.contentView addSubview:self.name1];
    [self.contentView addSubview:self.name2];
    [self.contentView addSubview:self.nameTF2];
    
    [self.name1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.width.equalTo(self.contentView).multipliedBy(0.18);
        make.height.mas_equalTo(@50);
    }];
    
    [self.nameTF1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name1.mas_right).with.offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self.contentView).multipliedBy(0.3);
    }];
    [self.name2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameTF1.mas_right).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.width.equalTo(self.contentView).multipliedBy(0.18);
        make.height.mas_equalTo(@50);
    }];
    
    [self.nameTF2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name2.mas_left).with.offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self.contentView).multipliedBy(0.3);
    }];
}

- (void)refreshCell{
    
}

    
    

@end
