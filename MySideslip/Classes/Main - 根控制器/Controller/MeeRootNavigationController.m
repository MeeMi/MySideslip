//
//  MeeRootNavigationController.m
//  MySideslip
//
//  Created by liwei on 16/5/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "MeeRootNavigationController.h"

@interface MeeRootNavigationController () // <UIGestureRecognizerDelegate>

@end

@implementation MeeRootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 重写返回按钮侧滑功能，就消失了
    // 必须重写 pop手势的代理
    // self.interactivePopGestureRecognizer.delegate = self;
}


// 第一次使用当类进行或者子类时进行用于
// 作用：初始化类
+ (void)initialize
{
    // 获取所以的所以的导航条（UINavigationBar）
    UINavigationBar *navBar = [UINavigationBar appearance];
    // navBar.backgroundColor = [UIColor redColor];
    // navBar.barTintColor = [UIColor redColor];
    // navBar.tintColor = [UIColor redColor];
    
    // 设置导航条字体的颜色
    NSMutableDictionary *mutaDic = [NSMutableDictionary dictionary];
    mutaDic[NSFontAttributeName] = [UIFont systemFontOfSize: 20];
    mutaDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:mutaDic];
    
    
    // UIBarMetricsDefault, //背景与图片保存一致
    // UIBarMetricsCompact, 与控制器保持一致
    [navBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.20 green:0.72 blue:0.92 alpha:1.00]] forBarMetrics:UIBarMetricsDefault];
    
    // 去掉导航条下边的黑线
    navBar.shadowImage = [[UIImage alloc] init];

    // 获取取全世界导航条UIBarItem
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    // 按钮正常状态
    NSMutableDictionary *attrNormal = [NSMutableDictionary dictionary];
    // 设置字体的大小和颜色
    attrNormal[NSFontAttributeName] = [UIFont systemFontOfSize:15];  // 默认情况下是粗体
    attrNormal[NSForegroundColorAttributeName] = [UIColor blackColor];
    [barItem setTitleTextAttributes:attrNormal forState:UIControlStateNormal];
    
    // 设置按钮不能点击状态
    NSMutableDictionary *attrDisable = [NSMutableDictionary dictionary];
    // 不设置字体大小，就默认用正常状态下的字体大小
    attrDisable[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [barItem setTitleTextAttributes:attrDisable forState:UIControlStateDisabled];
}



// 对所有push进来的 子控制的 导航条的左边的按钮进行统一的设置
// 重写方法pushViewController的目的：是拦截子控制器

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count != 0) {
        // 表示进入子控制器
        // 重新定义 子控制器导航条左边的返回按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置按钮的图片
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        // 设置按钮的文字
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        // 设置按钮文字的颜色
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        
        // 设置文字大小
        backButton.titleLabel.font = [UIFont systemFontOfSize:17];
        
        // 设置尺寸
        [backButton sizeToFit];
        
        // 设置按钮中的内边距
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        // backButton.titleEdgeInsets 设置按钮中的文字的内边距
        // backButton.imageEdgeInsets 设置按钮中的图片的内边距
        
        
        // 重写了左边的按钮，需要重写返回的点击事件
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        
        // 隐藏子控制器中的导航条
        // 注意：这个必须在push之前使用，才会起到作用
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


#pragma mark - UIGestureRecognizerDelegate代理方法
// 判断是否允许触发当前手势
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    // YES:手势有效, NO:手势无效
//    // 如果是子控制器，才有侧滑功能
//    
//    // if (self.viewControllers.count == 1) return NO;
//    // return YES;
//    
//    // 当时导航控制器的根控制器时，就不要手指有效，这样会有bug。因此导航控制器显示根控制器时，其中控制器数为 1
//    return self.viewControllers.count > 1 ;
//}


@end
