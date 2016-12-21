//
//  MainRobViewController.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/16.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "MainRobViewController.h"
#import "MainHearViewController.h"
#import "RobTableViewCell.h"
#import "RobDetailViewController.h"


@interface MainRobViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *arrayData;

@end

@implementation MainRobViewController

-(NSMutableArray *)arrayData {
    if (!_arrayData ) {
        _arrayData = [NSMutableArray array];
        [_arrayData addObject:@"1"];
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"抢单";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"听单" forState:0];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(segementClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"接单";
}

-(void)segementClick {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    MainHearViewController *vc = [[MainHearViewController alloc] init];
    NavViewController *nav = [[NavViewController alloc] initWithRootViewController:vc];
    delegate.viewController.centerPanel = nav;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"RobTableViewCell" owner:nil options:nil][0];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RobDetailViewController *vc = [[RobDetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
