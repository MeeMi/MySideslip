//
//  MeeSideViewController.h
//  MySideslip
//
//  Created by liwei on 16/5/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <UIKit/UIKit.h>
// #import "ICSDrawerController.h"

@interface MeeSideViewController : UIViewController<ICSDrawerControllerChild,ICSDrawerControllerPresenting>

@property(nonatomic, weak) ICSDrawerController *drawer;

@end
