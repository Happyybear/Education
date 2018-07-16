//
//  StockCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/2.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "StockCell.h"

@implementation StockCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.sureButton.layer.cornerRadius = 5;
}
- (IBAction)buttonClick:(id)sender {
    //确认
    self.stock(self.purposeTF.text, [self.goodsCountTF.text intValue]);
}

- (void)refreshUI:(GoodsModel *)good{
    self.goodsName.text = good.name;
    self.goodsCount.text = [NSString stringWithFormat:@"数量:%d",good.count];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
