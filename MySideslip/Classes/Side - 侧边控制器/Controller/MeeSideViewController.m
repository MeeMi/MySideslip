//
//  MeeSideViewController.m
//  MySideslip
//
//  Created by liwei on 16/5/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "MeeSideViewController.h"


@interface MeeSideViewController ()


@end

// 侧边操作的控制控制器
@implementation MeeSideViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = MeeRandomColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ICSDrawerControllerPresenting

// 告诉孩子控制器，抽屉控制器即将打开。
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

@end
