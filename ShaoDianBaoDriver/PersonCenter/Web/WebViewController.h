//
//  WebViewController.h
//  ShaoDianBao
//
//  Created by xin yang on 2016/11/9.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic ,assign) BOOL isPost;

@end
