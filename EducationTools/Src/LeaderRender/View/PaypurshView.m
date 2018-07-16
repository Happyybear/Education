//
//  PaypurshView.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "PaypurshView.h"
#import "SexButton.h"
#import "GoodsModel.h"
@interface PaypurshView()

@property (nonatomic,strong) NSMutableArray * buttonArr;

@property (nonatomic,strong) NSMutableArray * goodArr;

@end

@implementation PaypurshView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self configView:buttonArr];
        self.backgroundColor = [UIColor whiteColor];
        self.bgView = [FactoryUI createViewWithFrame:self.frame];
        self.bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.bgView];
        
        self.name = [[UILabel alloc] init];
        self.name.font = LabelFont;
        [self.bgView addSubview:self.name];
    }
    return self;
}

- (void)configView:(NSArray *)buttonArr title:(NSString *)title{
    
    self.goodArr = buttonArr;

    self.name.text = title;

    for (int i = 0; i<buttonArr.count; i++) {
        GoodsModel * good = buttonArr[i];
        CGSize size =  [@"书包包" getStringSizeWithAtteributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13.0f]}];
        UIButton * btn = [FactoryUI createSexButtonWithFrame:CGRectMake(SCREEN_W/5+10+(size.width+10+25)*i, 3, size.width+25, 41) title:good.name titleColor:[UIColor blackColor] imageName:nil backgroundImageName:nil target:self tag:10000+i selector:@selector(Click:)];
        [self.bgView addSubview:btn];
    }
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.width.equalTo(self).multipliedBy(0.2);
        make.height.mas_equalTo(@50);
    }];
}

- (void)Click:(UIButton *)button{
   
    GoodsModel * good = self.goodArr[button.tag - 10000];
    if (button.selected == YES) {
        button.selected = NO;
        [self.selectedItem removeObject:good.good_id];
    }else{
        button.selected = YES;
        [self.selectedItem addObject:good.good_id];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSMutableArray *)selectedItem{
    if (!_selectedItem) {
        _selectedItem = [[NSMutableArray alloc] init];
    }
    return _selectedItem;
}

- (NSMutableArray *)goodArr{
    if (!_goodArr) {
        _goodArr = [[NSMutableArray alloc] init];
    }
    return _goodArr;
}
@end
