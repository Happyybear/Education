//
//  HomeCell.m
//  EducationTools
//
//  Created by 王一成 on 2018/5/8.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell()

@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong)UILabel *label;
@end
@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        //设置CollectionViewCell中的图像框
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        [self.contentView addSubview:self.imageView];
        self.imageView.center = self.contentView.center;
        
        //文本框
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxX(self.imageView.frame) + 30, CGRectGetWidth(self.frame), 15)];
        self.label.font = [UIFont systemFontOfSize:13];
        self.label.textColor = RGB(102, 102, 102);
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.label];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)configView:(NSDictionary *)dict{
    self.imageView.image = [UIImage imageNamed:dict[@"picture"]];
    self.label.text =dict[@"title"];
}

@end
