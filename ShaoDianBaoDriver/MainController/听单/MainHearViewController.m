//
//  MainHearViewController.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/16.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "MainHearViewController.h"
#import "WaitAnimView.h"
#import "HearTableViewCell.h"
#import "NSString+ABString.h"
#import "AppDelegate.h"
#import "UIViewController+JASidePanel.h"
#import "MainRobViewController.h"

@interface MainHearViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *btnOff;
@property (weak, nonatomic) IBOutlet UIButton *btnPattern;
@property (nonatomic,strong) NSMutableArray *arrayData;
@property (weak, nonatomic) IBOutlet UIImageView *headerImgv;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *turnoverLab;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;
@property (weak, nonatomic) IBOutlet UILabel *tagLab;

@end

@implementation MainHearViewController

-(NSMutableArray *)arrayData {
    if (!_arrayData) {
        _arrayData = [NSMutableArray array];
        [_arrayData addObject:@"1"];
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"听单";
    self.btnOff.clipsToBounds = YES;
    self.btnOff.layer.cornerRadius = 25;
    self.btnOff.layer.borderWidth = 4;
    self.btnOff.layer.borderColor = [UIColor colorWithRed:0.96 green:0.62 blue:0.54 alpha:1.00].CGColor;
    self.btnPattern.clipsToBounds = YES;
    self.btnPattern.layer.cornerRadius = 25;
    self.btnPattern.layer.borderWidth = 4;
    self.btnPattern.layer.borderColor = [UIColor colorWithRed:0.96 green:0.62 blue:0.54 alpha:1.00].CGColor;
    WaitAnimView *view = [[WaitAnimView alloc] init];
    view.frame = CGRectMake((WIDTH -100)/2,HEIGHT - 64 - 50 - 85, 100, 100);
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"抢单" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(segementClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
-(void)segementClick {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MainRobViewController *vc = [[MainRobViewController alloc] init];
    NavViewController *nav = [[NavViewController alloc] initWithRootViewController:vc];
    delegate.viewController.centerPanel = nav;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
NSString *text = @"指派模式将持续为你匹配订单";
    CGFloat height = [text getSpaceLabelHeightwithSpeace:16 withFont:[UIFont systemFontOfSize:13] withWidth:WIDTH - 75];
    return 35 + 10 +height +10;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HearTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HearTableViewCell" owner:nil options:nil][0];
    }
    return cell;
}
- (IBAction)btnSelectenClick:(id)sender {
}

- (IBAction)getCarLAB:(id)sender {
    
}

@end
