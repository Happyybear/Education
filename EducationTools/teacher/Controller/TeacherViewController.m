//
//  TeacherViewController.m
//  EducationTools
//
//  Created by 王一成 on 2018/7/5.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "TeacherViewController.h"
#import "TeacherCell.h"
#import "YXCalendarView.h"
#import "AttenceViewController.h"
@interface TeacherViewController ()

@property (nonatomic, strong) YXCalendarView *calendar;
//获取投资日历的高度
@property (nonatomic, assign) CGFloat calendarHeight;

@end

@implementation TeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configMJ];
    [self configView];
    [self loadData];
    
}

- (void)configMJ{
    self.mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
}

- (void)loadData{
    [self.dataSource addObject:@"1"];
}
- (void)configView{
    self.title = @"学员考勤";
    self.view.backgroundColor = [UIColor whiteColor];
    self.mTableView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H-64-[YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Month]);
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    //加载投资日历
    [self.view addSubview:self.calendar];
}


/**
 *  日历的懒加载
 */
- (YXCalendarView *)calendar{
    if(!_calendar){
        _calendar = [[YXCalendarView alloc] initWithFrame:CGRectMake(0,SCREEN_H-64-[YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Month], [UIScreen mainScreen].bounds.size.width, [YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Month]) Date:[NSDate date] Type:CalendarType_Month];
        self.calendarHeight = [YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Month];
        __weak typeof (self) WeakSelf = self;
        //改变日历头部和tableView 的cell位置
        [self changeLocation];
        //点击日历某一个日期  进行数据刷新
        _calendar.sendSelectDate = ^(NSDate *selDate) {
//            [WeakSelf serviceDataByData:[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]];
        };
    }
    return _calendar;
}

/**
 *  改变日历头部和tableView 的cell位置
 */
- (void)changeLocation{
    __weak typeof(_calendar) weakCalendar = _calendar;
    __weak typeof (self) WeakSelf = self;
    _calendar.refreshH = ^(CGFloat viewH) {
        WeakSelf.calendarHeight = viewH;
        [UIView animateWithDuration:0.3 animations:^{
            weakCalendar.frame = CGRectMake(0, SCREEN_H-viewH-64, [UIScreen mainScreen].bounds.size.width, viewH);
        }];
    };
}
#pragma mark - **************** delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"schoolWork";
    TeacherCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];

    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TeacherCell" owner:self options:0]lastObject];
    }
    //点击考勤
    @WeakObj(self);
    cell.attenceAction = ^{
        AttenceViewController * att = [[AttenceViewController alloc] init];
        [selfWeak.navigationController pushViewController:att animated:YES];
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
