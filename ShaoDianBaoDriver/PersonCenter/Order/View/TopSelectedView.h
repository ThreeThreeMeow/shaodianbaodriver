//
//  TopSelectedView.h
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/28.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TopSelectedView : UIView

@property (nonatomic, strong) NSArray* titleArr;
@property (nonatomic, copy) void (^clickBtn)(NSInteger);
@property (nonatomic, copy) void (^clickSlideBtn)();
@property (nonatomic, weak) UIView* bottomView;
- (void)changeBtnColor:(NSInteger)tagNum;

@end
