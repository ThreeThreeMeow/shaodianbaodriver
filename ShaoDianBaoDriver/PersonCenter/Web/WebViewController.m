//
//  WebViewController.m
//  ShaoDianBao
//
//  Created by xin yang on 2016/11/9.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self.view addSubview:_webView];
    _webView.delegate = self;
    _webView.scrollView.bounces = NO;
    NSURL *url =[NSURL URLWithString:self.url];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    if (self.isPost) {
        NSString *body = [NSString stringWithFormat: @"auth=%@",AUTH];
        [request setHTTPMethod: @"POST"];
        [request setHTTPBody: [body dataUsingEncoding:NSUTF8StringEncoding]];
    } else {
        [request setHTTPMethod:@"GET"];
    }
    [_webView loadRequest: request];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
//function sendCommand(cmd,param){
//    var url="testapp:"+cmd+":"+param;
//    document.location = url;
//}
//function clickLink(){
//    sendCommand("alert","你好吗？");
//}

//[javascript]
//"button" value="Click me!" onclick="clickLink()" />

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@":"];
    if ([components count] > 1 && [(NSString *)[components objectAtIndex:0] isEqualToString:@"testapp"]) {
        if([(NSString *)[components objectAtIndex:1] isEqualToString:@"alert"])
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Alert from Cocoa Touch" message:[components objectAtIndex:2]
                                  delegate:self cancelButtonTitle:nil
                                  otherButtonTitles:@"OK", nil];
            [alert show];
        }
        return NO;
    }
    return YES;

}
@end
