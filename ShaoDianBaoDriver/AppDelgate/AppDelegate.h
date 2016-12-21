//
//  AppDelegate.h
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/15.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavViewController.h"
#import "JASidePanelController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NavViewController *nav;
@property (strong, nonatomic) JASidePanelController *viewController;

@end

