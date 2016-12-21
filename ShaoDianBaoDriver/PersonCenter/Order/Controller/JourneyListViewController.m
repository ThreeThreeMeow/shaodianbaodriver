//
//  JourneyListViewController.m
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/28.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "JourneyListViewController.h"
#import "OrderListTableViewCell.h"

#import "NoDataView.h"
#import <MJRefresh.h>

@interface JourneyListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NoDataView *_noDataView;
}
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *arrayData;
@property (nonatomic,assign) NSInteger page;

@end

@implementation JourneyListViewController

-(NSMutableArray*)arrayData {
    if (_arrayData == nil) {
        _arrayData = [NSMutableArray array];
    }
    return _arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.page = 1;
    [self loadUI];
//    [self requestData];
    _noDataView = [[NoDataView alloc]init];
    _noDataView.hidden = YES;
    [self.view addSubview:_noDataView];
    __weak JourneyListViewController *weakSelf = self;
    _noDataView.clickView = ^() {
        [weakSelf loadData];
    };
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.page = 0;
    [self requestData];
}

-(void)loadUI {
    self.view.backgroundColor = [UIColor colorWithRed:0.93 green:0.94 blue:0.94 alpha:1.00];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 46 - 64) style:UITableViewStylePlain];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 160;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(uploadData)];
}
-(void)loadData {
    self.page = 0;
    [self requestData];
}

-(void)uploadData {
    [self requestData];
    [self.tableView.mj_footer endRefreshing];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"OrderListTableViewCell" owner:nil options:nil][0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    [cell setDataWithModel:self.arrayData[indexPath.row]];
    return cell;
}

-(void)requestData {
//    NSDictionary *dict= @{@"status":self.status,@"auth":AUTH,@"page":@(self.page),@"page_count":@(6)};
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
// [HttpTool POST:[NSString stringWithFormat:@"%@con=app&act=order_me&auth=xxx",BASE_URL] parameters:dict success:^(id responseObject) {
//      [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//     if ([responseObject[@"code"] integerValue]  == 0) {
//         NSArray *data= responseObject[@"data"];
//         if (self.page == 0) {
//             [self.arrayData removeAllObjects];
//             [self.tableView.mj_header endRefreshing];
//         }
//         if (self.page == 0 && data.count == 0) {
//             _noDataView.hidden = NO;
//         }else {
//          _noDataView.hidden = YES;
//         }
//         
//         if (data.count > 0) {
//             self.page ++;
//            NSArray *array = [OrderModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
//             [self.arrayData addObjectsFromArray:array];
//         }
//         
//
//         [self.tableView reloadData];
//     }
//
// } failure:^(NSError *error) {
//         [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
// }];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    DetailViewController *vc =[[DetailViewController alloc]init];
//    OrderModel *model =self.arrayData[indexPath.row];
//    vc.order = model.id;
//    [self.navigationController pushViewController:vc animated:YES];
}

@end
