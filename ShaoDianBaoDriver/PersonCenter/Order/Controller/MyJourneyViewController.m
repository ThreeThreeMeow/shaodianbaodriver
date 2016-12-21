//
//  MyJourneyViewController.m
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/28.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "MyJourneyViewController.h"
#import "TopSelectedView.h"
#import "JourneyListViewController.h"

@interface MyJourneyViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet TopSelectedView *topView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat lastY;
@property (nonatomic,copy) NSMutableArray *array;

@end

@implementation MyJourneyViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"我的订单";
}

-(NSMutableArray *)array {
    if (_array == nil) {
        _array = [NSMutableArray arrayWithObjects:@"全部",@"未完成",@"已完成",@"已支付", nil];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(WIDTH * 4, HEIGHT - 46 - 64);
    self.topView.titleArr = self.array;
    __weak typeof(self) weakSelf = self;
    self.topView.clickBtn = ^(NSInteger tag) {
        weakSelf.scrollView.contentOffset = CGPointMake(WIDTH * (tag - 1), 0);
    };
    
    for (int i = 0; i < 4; i ++) {
        JourneyListViewController *vc = [[JourneyListViewController alloc]init];
        vc.status = [NSString stringWithFormat:@"%d",i];
        vc.view.frame = CGRectMake(WIDTH * i,0,WIDTH, HEIGHT - 46 - 64);
        [self addChildViewController:vc];
        [self.scrollView addSubview:vc.view];
    }
}

- (void)moveTopBarDid:(NSNotification*)note
{
    CGFloat moveY = [note.object floatValue];
    CGFloat moveRY = moveY - self.lastY;
    if (self.topView.transform.ty - moveRY >= -70 && self.topView.transform.ty - moveRY <= 0) {
        self.topView.transform = CGAffineTransformTranslate(self.topView.transform, 0, -moveRY);
        self.scrollView.transform = CGAffineTransformTranslate(self.scrollView.transform, 0, -moveRY);
    }
    else if (self.topView.transform.ty - moveRY < -70) {
        self.topView.transform = CGAffineTransformMakeTranslation(0, -70);
        self.scrollView.transform = CGAffineTransformMakeTranslation(0, -70);
    }
    else if (self.topView.transform.ty - moveRY > 0) {
        self.topView.transform = CGAffineTransformMakeTranslation(0, 0);
        self.scrollView.transform = CGAffineTransformMakeTranslation(0, 0);
    }
    
    self.lastY = moveY;
}
- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    self.topView.bottomView.transform = CGAffineTransformMakeTranslation(scrollView.contentOffset.x / 4, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    NSUInteger tagNum = (scrollView.contentOffset.x + WIDTH * 0.5) / WIDTH + 1;
    [self.topView changeBtnColor:tagNum];
}


@end
