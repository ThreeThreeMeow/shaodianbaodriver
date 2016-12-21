//
//  LoginViewController.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/18.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "LoginViewController.h"
#import "YXTextField.h"
#import "YXButton.h"
#import "NavViewController.h"
#import "JASidePanelController.h"
#import "MainRobViewController.h"
#import "MainHearViewController.h"
#import "PersonViewController.h"
#import "UIImage+Image.h"


@interface LoginViewController ()
@property (strong, nonatomic)  YXTextField *phoneTextField;
@property (strong, nonatomic)  YXTextField *codeTextField;
@property (strong, nonatomic)  YXButton *btnSure;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self.view.layer addSublayer: [self backgroundLayer]];
    UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage boxblurImage:[UIImage imageNamed:@"beijing"] withBlurNumber:0] ];
    imgv.frame = CGRectMake(0, 0, WIDTH, HEIGHT + 20);
    [self.view addSubview:imgv];
    [self loadUI];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)loadUI{
    self.phoneTextField = [[YXTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 30)];
    self.phoneTextField.center = CGPointMake(WIDTH/2,HEIGHT/2 + 30);
    self.phoneTextField.placeholderNormalStateColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    self.phoneTextField.placeholderSelectStateColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
    self.phoneTextField.tag = 0;
    [self.view addSubview:self.phoneTextField];
    
    self.codeTextField = [[YXTextField alloc]initWithFrame:CGRectMake(0, 0,270, 30)];
    self.codeTextField.center = CGPointMake(WIDTH/2 , self.phoneTextField.center.y+60);
    self.codeTextField.tag = 1;
    self.codeTextField.placeholderNormalStateColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    self.codeTextField.placeholderSelectStateColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
    [self.view addSubview:self.codeTextField];
    
    self.btnSure = [[YXButton alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    self.btnSure.center = CGPointMake(WIDTH/2, self.codeTextField.center.y+100);
    [self.view addSubview: self.btnSure];
    self.phoneTextField.ly_placeholder = @"请输入电话号码";
    self.codeTextField.ly_placeholder = @"请输入验证码";
    
    __weak LoginViewController *weakSelf = self;
    self.btnSure.click =^{
//        [weakSelf isAuth];
//        [weakSelf.btnSure removeAllAnimation];
    };
}



-(void)isAuth {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    JASidePanelController*viewController = [[JASidePanelController alloc] init];
    viewController.shouldDelegateAutorotateToVisiblePanel = NO;
    viewController.leftPanel = [[PersonViewController alloc] init];
    NavViewController *nav = [[NavViewController alloc] initWithRootViewController:[[MainHearViewController alloc] init]];
    viewController.centerPanel = nav;
    delegate.viewController = viewController;
    delegate.nav = nav;
    [self presentViewController:viewController animated:YES completion:^{
        delegate.window.rootViewController = viewController;
    } ];
}

-(CAGradientLayer *)backgroundLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor purpleColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.locations = @[@0.65,@1];
    return gradientLayer;
}

@end
