//
//  NavViewController.m
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/26.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation NavViewController
+ (void)initialize {
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:textAttrs];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.26 blue:0.13 alpha:1.00];
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.98 green:0.26 blue:0.13 alpha:1.00];
    self.navigationBar.translucent = NO;
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){ NSArray *list=self.navigationBar.subviews;for (id obj in list) {if ([obj isKindOfClass:[UIImageView class]]) { UIImageView *imageView=(UIImageView *)obj; NSArray *list2=imageView.subviews;for (id obj2 in list2) { if ([obj2 isKindOfClass:[UIImageView class]]) { UIImageView *imageView2=(UIImageView *)obj2;imageView2.hidden=YES;}}}}}
    __weak NavViewController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        weakSelf.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES ) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    if (self.viewControllers.count > 0) {
        UIImage *image = [UIImage imageNamed:@"返回"];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewController.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(popBtn)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popBtn {
    [self popViewControllerAnimated:YES];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES ){
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return  [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] ) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return [super popToViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ( gestureRecognizer == self.interactivePopGestureRecognizer) {
        if ( self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    return YES;
}

@end
