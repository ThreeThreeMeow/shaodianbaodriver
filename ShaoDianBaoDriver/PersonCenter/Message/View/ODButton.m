//
//  ODButton.m
//  oudaBuyer
//
//  Created by yangxin on 16/1/20.
//  Copyright © 2016年 ouda. All rights reserved.
//

#import "ODButton.h"

@implementation ODButton

//官方在视频中给出的示例源码
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)withEvent {
//    CGRect bounds = self.bounds;
//    CGFloat widthDelta = 44.0 - bounds.size.width;
//    CGFloat heightDelta = 44.0 - bounds.size.height;
//    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
//    return CGRectContainsPoint(bounds, point);
//}

//修正后的代码如下：
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event {
    CGRect bounds = self.bounds;
    CGFloat widthDelta = MAX(60.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(60.0 - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

@end
