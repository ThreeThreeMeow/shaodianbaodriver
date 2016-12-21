//
//  YXTextField.h
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/18.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXTextField : UIView
//注释信息
@property (nonatomic,copy) NSString *ly_placeholder;

//光标颜色
@property (nonatomic,strong) UIColor *cursorColor;

//注释普通状态下颜色
@property (nonatomic,strong) UIColor *placeholderNormalStateColor;

//注释选中状态下颜色
@property (nonatomic,strong) UIColor *placeholderSelectStateColor;

@end
