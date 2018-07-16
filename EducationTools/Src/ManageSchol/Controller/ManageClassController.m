//
//  ManageClassController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/10.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "ManageClassController.h"
#import "HomeCell.h"
#import "LeaderRenderViewController.h"
#import "ApprocalViewController.h"
#import "PersonViewController.h"
#import "DataStaticsViewController.h"
#import "PeportFormViewController.h"
#import "DownPaymentViewController.h"
#import "SchoolWorkController.h"
#import "StockController.h"
#import "TeacherViewController.h"
#define inset 5
@interface ManageClassController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView * collectionView;

@property (nonatomic,strong) NSMutableArray * dataSource;
@end

@implementation ManageClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self setData];
}

- (void)initView{
    
    self.title = @"言致教育";
    
    self.view.backgroundColor = RGB(235, 235, 244);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = RGB(238, 238, 238);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    [self.view addSubview:self.collectionView];
    //注册Cell
    [self.collectionView registerClass:[HomeCell class] forCellWithReuseIdentifier:@"cell"];
    
}
#pragma mark - **************** data

-(NSMutableArray*)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)setData{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MainManger" ofType:@"plist"];
    self.dataSource = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
}

#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    NSDictionary * dict = self.dataSource[indexPath.row];
    
    [cell configView:dict];
    
    return cell;
}


#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake((SCREEN_W-inset) /3,(SCREEN_W / 3*1.3));
}



#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);//（上、左、下、右）
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return inset/2;
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView
//                   layout:(UICollectionViewLayout*)collectionViewLayout
//minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return kItemSpacing;
//}
#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return inset/2;
}

#pragma mark  点击CollectionView触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            LeaderRenderViewController * lvc = [[LeaderRenderViewController alloc] init];
            [self.navigationController pushViewController:lvc animated:YES];
        }
            break;
        case 1:{
            ApprocalViewController * ap = [[ApprocalViewController alloc] init];
            [self.navigationController pushViewController:ap animated:YES];
        }
            
            break;
        case 2:{//班级管理
            SchoolWorkController * payVc = [[SchoolWorkController alloc] init];
            payVc.school_id = self.school_id;
            [self.navigationController pushViewController:payVc animated:YES];
        }
            
            break;
        case 3:{
            PersonViewController * pv = [[PersonViewController alloc] init];
            [self.navigationController pushViewController:pv animated:YES];
        }
            
            break;
        case 4:{
            SchoolWorkController * sVC = [[SchoolWorkController alloc] init];
            [self.navigationController pushViewController:sVC animated:YES];
        }
            
            break;
        case 5:{
            StockController * stVC = [[StockController alloc] init];
            [self.navigationController pushViewController:stVC animated:YES];
        }
            
            break;
        case 6:{
            PeportFormViewController *PVC = [[PeportFormViewController alloc] init];
            [self.navigationController pushViewController:PVC animated:YES];
        }
            break;
        case 7:{
            DataStaticsViewController *dataVc= [[DataStaticsViewController alloc] init];
            [self.navigationController pushViewController:dataVc animated:YES];
        }
            
            break;
        case 8:{
            TeacherViewController * teaVC = [[TeacherViewController alloc] init];
            [self.navigationController pushViewController:teaVC animated:YES];
        }
            
            break;
            
        default:
            break;
    }
    NSLog(@"---------------------");
    
}

#pragma mark  设置CollectionViewCell是否可以被点击
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
