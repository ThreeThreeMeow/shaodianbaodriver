//
//  YXButton.h
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/18.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXButtonDelegate <NSObject>
-(void)clickBtnOn;
@end


@interface YXButton : UIView

@property (nonatomic,copy) void (^click)();
@property (nonatomic,weak)id<YXButtonDelegate> delegate;

-(void)clickAnimation;
@end
