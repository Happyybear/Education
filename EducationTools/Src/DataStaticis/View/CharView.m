//
//  CharView.m
//  HYSEM
//
//  Created by 王一成 on 2017/8/3.
//  Copyright © 2017年 WGM. All rights reserved.
//

#import "CharView.h"

@interface CharView ()<ChartViewDelegate,IChartAxisValueFormatter>

@property (nonatomic,strong) HorizontalBarChartView *LineChartView;
@property (nonatomic,strong) HorizontalBarChartView *horizontalChartView;
@property (nonatomic,strong) BarChartView  *barChartView;
@property (nonatomic,strong) BarChartData  *data;
@property (nonatomic,strong) NSMutableArray *displayData;
@property (nonatomic,strong) NSMutableArray *dataSource;
//y名称
@property (nonatomic,copy) NSString *yName;

@end

@implementation CharView

- (id)initWithFrame:(CGRect)frame chartStyle:(CHART_STYLE)style
{
    self = [super initWithFrame:frame];
    if (self) {
        if (style == HorizontalChart) {
            self.barChartView = [[HorizontalBarChartView alloc] initWithFrame:frame];
        }else if (style == LineChart){
            self.barChartView = [[BarChartView alloc] initWithFrame:frame];
        }
        [self addView];
    }
    return self;
}

- (NSMutableArray *)displayData
{
    if (!_displayData) {
        _displayData  = [[NSMutableArray alloc] init];
    }
    return _displayData;
}
//添加视图
-(void)addView{
    [self initChartView];
    [self setCharViewStyle];
    [self setChartViewInterface];
    [self setXStyle];
    [self setYStyle];
//    [self darwStartWith:nil yValue:nil limit:nil];
//    self.barChartView.leftAxis.enabled = NO;
//    self.barChartView.rightAxis.enabled = NO;
}
/************开始加载数据图表样式***************/
-(void)darwStartWith:(DeviceModel *)data {
    
    //设置限制线
//    [self setLimitLine:limit];
    // y轴显示数据
//    _yName = yValue;
     //为柱形图提供数据
    self.data = [self setDataWithData:data];
    if (data) {
        self.barChartView.data = self.data;
    }else{
        self.barChartView.data = nil;
    }
    //设置动画效果，可以设置X轴和Y轴的动画效果
    [self.barChartView animateWithYAxisDuration:1.0f];
    self.barChartView.legend.enabled = NO;//不显示图例说明
    //是否显示描述
    self.barChartView.chartDescription.enabled = NO;
    //NoData
    self.barChartView.noDataText = @"暂无数据";
}
#pragma mark - **************** 县知县
-(void)setLimitLine:(NSString *)limitNum{
    ChartYAxis *rightAxis = self.barChartView.rightAxis;//获取Y轴
    [rightAxis removeAllLimitLines];
    if ([limitNum intValue] == 0) {
        return;
    }
    ChartLimitLine *limitLine = [[ChartLimitLine alloc] initWithLimit:[limitNum floatValue] label:@""];
    limitLine.lineWidth = 2;
    limitLine.lineColor = [UIColor redColor];
    limitLine.lineDashLengths = @[@10.0f, @2.0f];//虚线样式
    limitLine.labelPosition = ChartLimitLabelPositionRightTop;//位置
    [rightAxis addLimitLine:limitLine];//添加到Y轴上
}
/************初始化图表***************/
- (void)initChartView
{
    self.barChartView.delegate = self;//设置代理
    [self addSubview:self.barChartView];
}
/************设置图表样式***************/
-(void)setCharViewStyle{
    self.barChartView.backgroundColor = RGB(230, 253, 253);
    self.barChartView.noDataText = @"暂无数据";//没有数据时的文字提示
    self.barChartView.noDataTextColor = [UIColor blackColor];
    self.barChartView.noDataFont = [UIFont systemFontOfSize:18];
    self.barChartView.drawValueAboveBarEnabled = YES;//数值显示在柱形的上面还是下面
    self.barChartView.highlightFullBarEnabled = YES;//点击柱形图是否显示箭头
    self.barChartView.drawBarShadowEnabled = NO;//是否绘制柱形的阴影背景
    self.barChartView.pinchZoomEnabled = YES;
    self.barChartView.legend.enabled = YES;//是否启用标注栏
}

/************设置图表交互***************/
- (void)setChartViewInterface{
    self.barChartView.scaleYEnabled = NO;//取消Y轴缩放
    self.barChartView.doubleTapToZoomEnabled = NO;//取消双击缩放
    self.barChartView.dragEnabled = YES;//启用拖拽图表
    self.barChartView.dragDecelerationEnabled = YES;//拖拽后是否有惯性效果
    self.barChartView.dragDecelerationFrictionCoef = 0.9;//拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
    self.barChartView.scaleXEnabled = YES;
}

/************设置X轴Style**************/
- (void)setXStyle{
    //获取图表X轴
    ChartXAxis *xAxis = self.barChartView.xAxis;
    xAxis.axisLineWidth = 0.5;//设置X轴线宽
    xAxis.labelPosition = XAxisLabelPositionBottom;//X轴的显示位置，默认是显示在上面的
    xAxis.drawGridLinesEnabled = NO;//不绘制网格线
    xAxis.labelTextColor = [UIColor brownColor];//label文字颜色
    xAxis.labelFont = [UIFont systemFontOfSize:11];
    xAxis.drawLabelsEnabled = YES;
    xAxis.gridLineWidth = 1;
    xAxis.valueFormatter = self;
    xAxis.forceLabelsEnabled= YES;//不强制绘制制定数量的label

    //最多12个月分
    xAxis.labelCount = 12;
}
/************设置Y轴样式***************/
-(void)setYStyle{
//    self.barChartView.descriptionText = @"kwh";
    //    barChartView默认样式中会绘制左右两侧的Y轴，首先需要先隐藏右侧的Y轴，代码如下：
    self.barChartView.pinchZoomEnabled = YES;
    self.barChartView.rightAxis.enabled = NO;//不绘制右边轴
    self.barChartView.leftAxis.enabled = YES;
 
    ChartYAxis *leftAxis = self.barChartView.leftAxis;//获取Y轴
    leftAxis.forceLabelsEnabled = YES;//不强制绘制制定数量的label
    leftAxis.drawZeroLineEnabled = YES;//从0开始绘制
    leftAxis.inverted = NO;//是否将Y轴进行上下翻转
    leftAxis.axisLineWidth = 0.5;//Y轴线宽
    leftAxis.axisLineColor = [UIColor blackColor];//Y轴颜色
    leftAxis.axisMinimum = 0;//设置Y轴的最小值
    leftAxis.axisMaximum = 100;//设置Y轴的最大值
    leftAxis.forceLabelsEnabled = NO;
    //    设置Y轴上标签的样式，代码如下：
    
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;//label位置
    leftAxis.labelTextColor = [UIColor blackColor];//文字颜色
//    leftAxis.labelFont = [UIFont systemFontOfSize:10.0f];//文字字体
    leftAxis.labelFont = [UIFont systemFontOfSize:8.0f];
    //    设置Y轴上标签显示数字的格式，代码如下：
    
//    leftAxis.valueFormatter = [[ChartIndexAxisValueFormatter alloc] init];//自定义格式
//        leftAxis.valueFormatter.positiveSuffix = @" $";//数字后缀单位
    //    设置Y轴上网格线的样式，代码如下：
    
    leftAxis.gridLineDashLengths = @[@3.0f, @3.0f];//设置虚线样式的网格线
    leftAxis.gridColor = [UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1];//网格线颜色
    leftAxis.gridAntialiasEnabled = YES;//开启抗锯齿
    leftAxis.gridLineWidth = 0.3f;
    leftAxis.drawLimitLinesBehindDataEnabled = YES;//设置限制线绘制在柱形图的后面
}

/**********************为barChartView的提供数据********************/
//为柱形图设置数据
- (BarChartData *)setDataWithData:(NSMutableArray *)recieveData{
    //拿出数据进行处理
    self.dataSource = [[NSMutableArray alloc] init];
    self.dataSource = recieveData;
//    [self getData];
    
    
    int xVals_count = 3;//X轴上要显示多少条数据
    double maxYVal = 100;//Y轴的最大值
    double maxValue = 0;//最大的数字
    
    //X轴上面需要显示的数据
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    for (int i = 0; i < xVals_count; i++) {
        [xVals addObject:[NSString stringWithFormat:@"%d月", i+1]];
    }
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    
    for (int i = 0 ; i<12; i++) {
        BarChartDataEntry *entry = [[BarChartDataEntry alloc] initWithX:i y:arc4random()%100];
        [yVals addObject:entry];
    }
    
        //创建BarChartDataSet对象，其中包含有Y轴数据信息，以及可以设置柱形样式
    if (1) {
        BarChartDataSet *set = [[BarChartDataSet alloc] initWithValues:yVals label:nil];
        set.barBorderWidth = 0.5;
        set.drawValuesEnabled = YES;//是否在柱形图上面显示数值
        set.highlightEnabled = YES;//点击选中柱形图是否有高亮效果，（双击空白处取消选中）
        [set setColors:ChartColorTemplates.material];//设置柱形图颜色
        //将BarChartDataSet对象放入数组中
        [dataSets addObject:set];
    }else{
        BarChartDataSet *set = [[BarChartDataSet alloc] initWithValues:yVals label:nil];
        set.barBorderWidth = 0.5;//柱形之间的间隙占整个柱形(柱形+间隙)的比例
        set.drawValuesEnabled = YES;//是否在柱形图上面显示数值
        set.highlightEnabled = YES;//点击选中柱形图是否有高亮效果，（双击空白处取消选中）
        [set setColors:ChartColorTemplates.material];//设置柱形图颜色
        
        //将BarChartDataSet对象放入数组中
        [dataSets addObject:set];
    }
    
    //创建BarChartData对象, 此对象就是barChartView需要最终数据对象
    //    BarChartData *data = [[BarChartData alloc] initWithXVals:xVals dataSets:dataSets];
    #pragma mark - **************** 显示数组的设置
    BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.f]];//文字字体
    [data setValueTextColor:[UIColor whiteColor]];//文字颜色
    [data setValueFont:[UIFont systemFontOfSize:10]];
//    data set
    // 更改显示格式
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    
    [numFormatter setNumberStyle:0];
    [numFormatter setPositiveFormat:@"#0.00"];
    ChartDefaultValueFormatter *formatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:numFormatter];
    [data setValueFormatter:formatter];
    [data setValueFont:[UIFont systemFontOfSize:10]];
    [data setValueTextColor:[UIColor blackColor]];
    return data;
}

#pragma mark - **************** delegate
//1.点击选中柱形图时的代理方法，代码如下：

- (void)chartValueSelected:(ChartViewBase * _Nonnull)chartView entry:(ChartDataEntry * _Nonnull)entry dataSetIndex:(NSInteger)dataSetIndex highlight:(ChartHighlight * _Nonnull)highlight{
    //    NSLog(@"---chartValueSelected---value: %g", entry.value);
}
//2.没有选中柱形图时的代理方法，代码如下：

- (void)chartValueNothingSelected:(ChartViewBase * _Nonnull)chartView{
    NSLog(@"---chartValueNothingSelected---");
}
//当选中一个柱形图后，在空白处双击，就可以取消选择，此时会回调此方法.

//3.捏合放大或缩小柱形图时的代理方法，代码如下：

- (void)chartScaled:(ChartViewBase * _Nonnull)chartView scaleX:(CGFloat)scaleX scaleY:(CGFloat)scaleY{
    NSLog(@"---chartScaled---scaleX:%g, scaleY:%g", scaleX, scaleY);
}
//4.拖拽图表时的代理方法

- (void)chartTranslated:(ChartViewBase * _Nonnull)chartView dX:(CGFloat)dX dY:(CGFloat)dY{
    NSLog(@"---chartTranslated---dX:%g, dY:%g", dX, dY);
}

- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis
{
    return [NSString stringWithFormat:@"%d",(int)value+1];
}
//是否为整数
- (BOOL)isNumText:(NSString *)str{
    NSString * regex        = @"^\\d*.0";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch            = [pred evaluateWithObject:str];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
}

///是否为整数
- (BOOL)isNum2Text:(NSString *)str{
    NSString * regex        = @"^\\d*.2";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch            = [pred evaluateWithObject:str];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
}

@end
