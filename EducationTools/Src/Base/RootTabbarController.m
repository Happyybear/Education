//
//  RootTabbarController.m
//  EducationTools
//
//  Created by 王一成 on 2018/4/26.
//  Copyright © 2018年 Yicheng.Wang. All rights reserved.
//

#import "RootTabbarController.h"
#import "ViewController.h"
@interface RootTabbarController ()<UITabBarControllerDelegate, CYLTabBarControllerDelegate>


@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self customizeTabBarForController];
    [self setupViewControllers];
    // Do any additional setup after loading the view.
}
- (void)setupViewControllers {
    ViewController *v1 = [[ViewController alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:v1];
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:v1];
    UIViewController *firstNavigationController1 = [[UINavigationController alloc]
                                                   initWithRootViewController:v1];
    [self setViewControllers:@[
                                           firstNavigationController,
                                           secondNavigationController,
                                           firstNavigationController1
                                           ]];
}


/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController{
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"tabBar_essence_icon",
                            CYLTabBarItemSelectedImage : @"tabBar_essence_click_icon",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"同城",
                            CYLTabBarItemImage : @"tabBar_new_icon",
                            CYLTabBarItemSelectedImage :@"tabBar_new_click_icon",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"同城",
                            CYLTabBarItemImage : @"tabBar_new_icon",
                            CYLTabBarItemSelectedImage :@"tabBar_new_click_icon",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1,dict2,dict3 ];
    self.tabBarItemsAttributes = tabBarItemsAttributes;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    // 如果 PlusButton 也添加了点击事件，那么点击 PlusButton 后不会触发该代理方法。
    if ([control isKindOfClass:[CYLExternPlusButton class]]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
    } else if ([control isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        for (UIView *subView in control.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                animationView = subView;
            }
        }
    }
    
    if ([self cyl_tabBarController].selectedIndex % 2 == 0) {
        [self addScaleAnimationOnView:animationView];
    } else {
        [self addRotateAnimationOnView:animationView];
    }
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView {
    //需要实现的帧动画，这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration = 1;
    animation.calculationMode = kCAAnimationCubic;
    [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
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
