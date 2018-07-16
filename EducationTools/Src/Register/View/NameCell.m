//
//  NameCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/3.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "NameCell.h"
#import "SexButton.h"

@interface NameCell()

@property (nonatomic,strong) UIButton * women;

@property (nonatomic,strong) UIButton * men;

@end

@implementation NameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configView{
    
    self.name = [[UILabel alloc] init];
    self.name.font = LabelFont;
    self.nameTF = [[UITextField alloc] init];
    self.nameTF.delegate = self;
    [self.nameTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.sex = [[UILabel alloc] init];
    self.sex.font = LabelFont;
    
    self.women = [SexButton buttonWithType:UIButtonTypeCustom];
    self.women.frame = CGRectMake(0, 0, 50, 44);
    
    
    [self.women setTitle:@"女" forState:UIControlStateNormal];

    self.women = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"女" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10000 selector:@selector(sexClick:)];
    
     self.men = [FactoryUI createSexButtonWithFrame:CGRectMake(0, 0, 50, 44) title:@"男" titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10001 selector:@selector(sexClick:)];
    
    self.name.text = @"姓名:";
    self.sex.text = @"性别:";
    
    [self.contentView addSubview:self.nameTF];
    [self.contentView addSubview:self.name];
    [self.contentView addSubview:self.women];
    [self.contentView addSubview:self.men];
    [self.contentView addSubview:self.sex];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.width.equalTo(self.contentView).multipliedBy(0.2);
        make.height.mas_equalTo(@50);
    }];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name.mas_right).with.offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(@50);
        make.width.equalTo(self.contentView).multipliedBy(0.3);
    }];
    
    [_sex mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(_nameTF.mas_right).with.offset(5);
        make.height.mas_equalTo(@50);
        make.top.equalTo(self.contentView).offset(0);
        make.width.equalTo(self.contentView).multipliedBy(0.1);

    }];
    
    [_men mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_sex.mas_right).with.offset(3);
        make.height.mas_equalTo(@44);
        make.top.equalTo(self.contentView).offset(3);
        make.width.mas_offset(@50);
        
    }];
    
    [_women mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_men.mas_right).with.offset(3);
        make.height.mas_equalTo(@44);
        make.top.equalTo(self.contentView).offset(3);
        make.width.mas_offset(@50);
    }];
    
    
}
- (void)sexClick:(UIButton *)btn{
    if (btn.tag == 10000) {
        if (btn.selected) {
            self.contetModel.value2 = @"1";
            self.women.selected = NO;
        }else{
            self.contetModel.value2 = @"0";
            self.women.selected = YES;
            self.men.selected = NO;
        }
    }else{
        if (btn.selected) {
            self.contetModel.value2 = @"1";
            self.men.selected = NO;
        }else{
            self.contetModel.value2 = @"0";
            self.men.selected = YES;
            self.women.selected = NO;
        }
    }
}

- (void)setCellWith:(ContentModel *)model{
    self.contetModel = model;
    [self.nameTF setText:model.value1];
}

#pragma mark - **************** delegate

- (void)textFieldDidChange:(UITextField *)textField{
    if (textField == self.nameTF) {
        self.contetModel.value1 = self.nameTF.text;
    }
}
@end
