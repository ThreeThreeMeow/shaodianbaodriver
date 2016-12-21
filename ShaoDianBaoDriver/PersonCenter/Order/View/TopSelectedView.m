//
//  TopSelectedView.m
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/28.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "TopSelectedView.h"

@interface TopSelectedView()<UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger numTag;
@end
@implementation TopSelectedView



- (void)setTitleArr:(NSArray*)titleArr
{
    _titleArr = titleArr;
    UIScreen* scr = [UIScreen mainScreen];
    CGFloat btnW = scr.bounds.size.width / 4;
    CGFloat btnH = 44;
    CGFloat btnY = 0;
    
    for (NSInteger i = 0; i < titleArr.count; i++) {
        UIButton* navBtn = [[UIButton alloc] init];
        navBtn.frame = CGRectMake(btnW * i, btnY, btnW, btnH);
        [self addSubview:navBtn];
        [navBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        navBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [navBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        navBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        navBtn.tag = i + 1;
        [navBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [(UIButton*)[self viewWithTag:1] setTitleColor:[UIColor colorWithRed:0.95 green:0.25 blue:0.13 alpha:1.00] forState:UIControlStateNormal];
    
    self.numTag = 1;
    
    UIView* bottomBar = [[UIView alloc] initWithFrame:CGRectMake(0,44, btnW, 2)];
    
    bottomBar.backgroundColor = [UIColor colorWithRed:0.98 green:0.00 blue:0.00 alpha:1.00];
    
    bottomBar.layer.cornerRadius = 1;
    
    [self addSubview:bottomBar];
    
    self.bottomView = bottomBar;
}


- (void)navBtnClick:(UIButton*)btn
{
    [self changeBtnColor:btn.tag];
    
    if (self.clickBtn) {
        self.clickBtn(btn.tag);
    }
}

- (void)changeBtnColor:(NSInteger)tagNum
{
    if (self.numTag != 0) {
        [(UIButton*)[self viewWithTag:self.numTag] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [(UIButton*)[self viewWithTag:tagNum] setTitleColor:[UIColor colorWithRed:0.95 green:0.25 blue:0.13 alpha:1.00] forState:UIControlStateNormal];
    
    self.numTag = tagNum;
}

@end
