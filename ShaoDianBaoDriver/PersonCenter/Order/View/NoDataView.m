//
//  NoDataView.m
//  ShaoDianBao
//
//  Created by 光小星 on 2016/11/15.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "NoDataView.h"
#import <Masonry.h>

@implementation NoDataView

-(id)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.frame = CGRectMake(0,0,WIDTH,HEIGHT);
        self.backgroundColor = [UIColor whiteColor];
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
        recognizer.numberOfTapsRequired = 1;
        recognizer.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:recognizer];
        
        UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nosignal(1)"]];
        [self addSubview:imgv];
        [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset (-110);
        }];
        
        UILabel *lab = [[UILabel alloc] init];
        lab.text = @"点击刷新";
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = [UIColor redColor];
        [self addSubview:lab];
        lab.font = [UIFont systemFontOfSize:16];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(imgv.mas_bottom).offset (20);
        }];
    }
    return self;
}

-(void)click {
    self.clickView();
}

@end
