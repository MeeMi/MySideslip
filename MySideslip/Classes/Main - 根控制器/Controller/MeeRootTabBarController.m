//
//  MeeRootTabBarController.m
//  MySideslip
//
//  Created by liwei on 16/5/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "MeeRootTabBarController.h"
#import "MeeRootNavigationController.h"
#import "MeeFriendsViewController.h"
#import "MeeMessageViewController.h"

@interface MeeRootTabBarController ()

@end

@implementation MeeRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // 添加子控制器
    [self setupChildVcs];
}



- (void)setupChildVcs
{
    MeeMessageViewController *messageVc = [[MeeMessageViewController alloc]init];
    [self setupOneVc:messageVc image:@"tab_recent" selectedImage:@"tab_recent_press" title:@"消息"];
    
    MeeFriendsViewController *friedsVc = [[MeeFriendsViewController alloc]init];
    [self setupOneVc:friedsVc image:@"tab_buddy" selectedImage:@"tab_buddy_press" title:@"联系人"];
}


#pragma mark -添加单个控制器
- (void)setupOneVc:(UIViewController *)vc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    // 给控制器添加导航控制器
    UINavigationController *nav = [[MeeRootNavigationController alloc]initWithRootViewController:vc];
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:nav];
}

@end
