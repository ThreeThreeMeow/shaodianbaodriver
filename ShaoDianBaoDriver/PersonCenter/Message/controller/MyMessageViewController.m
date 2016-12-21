//
//  MyMessageViewController.m
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/29.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "MyMessageViewController.h"
#import "MessageClass.h"
#import "MessageModel.h"
#import "MyMessageTableViewCell.h"
//#import "WebViewController.h"
//#import "DetailViewController.h"
#import "NoDataView.h"

@interface MyMessageViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NoDataView *_noDataView;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *array;

@end


@implementation MyMessageViewController
-(NSMutableArray *)array {
    if (_array == nil) {
        _array = [NSMutableArray array];
        MessageClass *class= [[MessageClass alloc] init];
        for (MessageModel *model in [class SelectData]) {
            [_array addObject:model];
        }
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
    self.tableView.delegate = self;
    self.tableView.rowHeight = 110;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"清空" forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor whiteColor] forState:0];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(nextBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    _noDataView = [[NoDataView alloc]init];
    _noDataView.hidden = YES;
    [self.view addSubview:_noDataView];
    __weak MyMessageViewController * weakself = self;
    _noDataView.clickView =^{
        [weakself.array removeAllObjects];
        MessageClass *class= [[MessageClass alloc] init];
        for (MessageModel *model in [class SelectData]) {
            [weakself.array addObject:model];
        }
        [weakself.tableView reloadData];
    };
    
    if (self.array.count == 0) {
        _noDataView.hidden = NO;
    }


}
-(void)nextBtn {
    MessageClass *class= [[MessageClass alloc] init];
    [class deleteData];
    [self.array removeAllObjects];
    [self.tableView reloadData];
     _noDataView.hidden = NO;
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"我的消息";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"MyMessageTableViewCell" owner:nil options:nil][0];
    }
    [cell setDataWithModel:self.array[indexPath.row]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    MessageModel *model = self.array[indexPath.row];
//    if ([model.type isEqualToString:@"order"]) {
//        DetailViewController *vc =[[DetailViewController alloc]init];
//        vc.order = model.order_id;
//        [self.navigationController pushViewController:vc animated:YES];
//    }else if ([model.type isEqualToString:@"message"]) {
//        WebViewController *vc = [[WebViewController alloc]init];
//        vc.url = model.order_id;
//        vc.title = model.title;
//        [self.navigationController pushViewController:vc animated:YES];
//    }

}


@end
