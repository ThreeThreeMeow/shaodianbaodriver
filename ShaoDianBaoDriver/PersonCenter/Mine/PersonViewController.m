//
//  PersonViewController.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/16.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "PersonViewController.h"
#import "MainRobViewController.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"
#import "MyJourneyViewController.h"
#import "MyMessageViewController.h"

@interface PersonViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnOff;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLab;
@property (weak, nonatomic) IBOutlet UILabel *onlineMoney;
@property (weak, nonatomic) IBOutlet UILabel *offlineLab;
@property (weak, nonatomic) IBOutlet UIImageView *headerImgv;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnOff.clipsToBounds = YES;
    self.btnOff.layer.cornerRadius = 60;
    self.btnOff.layer.borderWidth = 4;
    self.btnOff.layer.borderColor = [UIColor colorWithRed:0.96 green:0.62 blue:0.54 alpha:1.00].CGColor;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)orderBtnClick:(id)sender {
    MyJourneyViewController *vc = [[MyJourneyViewController alloc] init];
    [self pushVC:vc];
}


- (IBAction)messageBtn:(id)sender {
    MyMessageViewController *message = [[MyMessageViewController alloc] init];
    [self pushVC:message];
}


- (IBAction)btnOffClick:(id)sender {
    
}

- (IBAction)fingerpostBtn:(id)sender {
    
}

- (IBAction)settingBtnClick:(id)sender {
    
}

-(void)pushVC:(UIViewController *)vc {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.nav pushViewController:vc animated:YES];
    [self.sidePanelController showCenterPanelAnimated:NO];

}



@end
