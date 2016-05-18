//
//  MeeMessageViewController.m
//  MySideslip
//
//  Created by liwei on 16/5/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "MeeMessageViewController.h"
#import <YLImageView.h>
#import <YLGIFImage.h>
#import "AppDelegate.h"


@interface MeeMessageViewController ()


@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation MeeMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.appDelegate = [UIApplication sharedApplication].delegate ;
    
    [self setupNav];
}

- (void)setupNav
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"hamburger"] forState:UIControlStateNormal];
    // 设置按钮的尺寸
    // [rightBtn sizeToFit];
    rightBtn.width = 20;
    rightBtn.height = 20;
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item;
    
    
    // 左边的图片
    YLImageView *leftImageView = [[YLImageView alloc]init];
    leftImageView.image = [YLGIFImage imageNamed:@"ermilio.gif"];
    
    // UIImageView *leftImageView = [[UIImageView alloc]init];
    // 利用UIImage + GIF 加载动态图
    // leftImageView.image = [UIImage sd_animatedGIFNamed:@"niconiconi@2x.gif"];
    leftImageView.contentMode = UIViewContentModeScaleAspectFill;
    leftImageView.width = 40;
    leftImageView.height = 40;
    leftImageView.userInteractionEnabled = YES;
    leftImageView.layer.cornerRadius = 20;
    leftImageView.layer.masksToBounds = YES;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftImageView];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 给图片添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openDrawer:)];
    [leftImageView addGestureRecognizer:tap];
    
    [self.appDelegate.drawer hiddenHeadView:^(CGFloat alpha) {
        leftImageView.alpha = alpha;
        NSLog(@" alpha----- > %lf ",alpha);
        self.appDelegate.drawer.leftViewController.view.alpha = 1.0 - alpha + 0.2;
    }];

    
}

#pragma mark - 打开抽取方法
- (void)openDrawer:(UITapGestureRecognizer *)tap
{
    [self.appDelegate.drawer open];
}


#pragma mark - 右边按钮点击事件
- (void)rightBtnClick
{
    NSLog(@"导航条右边按钮点击");
}

@end
