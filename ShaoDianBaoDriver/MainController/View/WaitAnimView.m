//
//  WaitAnimView.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/16.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "WaitAnimView.h"

@interface WaitAnimView (){
    CAShapeLayer *shapeLayer;
    CAGradientLayer *gradientLayer;
}

@end

@implementation WaitAnimView

-(id)init {
    if (self = [super init]) {
        self.clipsToBounds  = YES;
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = 50;
        [self loadUI];
    }
    return self;
}

-(void)loadUI {
    
    CGFloat radius = 48.0f;
    CGPoint arcCenter = CGPointMake(radius, radius);
    UIBezierPath *pacmanOpenPath;
    //定制一段圆弧
    pacmanOpenPath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.fillMode = kCAFillRuleEvenOdd;
    shapeLayer.path = pacmanOpenPath.CGPath;
    shapeLayer.strokeColor = [UIColor yellowColor].CGColor;
    shapeLayer.lineWidth = 4.0f;
    shapeLayer.lineJoin = kCALineJoinRound;
    //    [shapeLayer setLineDashPattern:
    //    [NSArray arrayWithObjects:[NSNumber numberWithInt:20], [NSNumber numberWithInt:15],
    //     nil]];
    
    
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.frame = CGRectMake(2,2,96, 96);
    NSMutableArray *colors = nil;
    if (colors == nil) {
        colors = [[NSMutableArray alloc] initWithCapacity:3];
        UIColor *color = nil;
        color = [UIColor redColor];
        [colors addObject:(id)[color CGColor]];
        color = [UIColor whiteColor];
        [colors addObject:(id)[color CGColor]];
    }
    gradientLayer = [CAGradientLayer layer];
    [gradientLayer setColors:colors];
    [self.layer addSublayer:gradientLayer];
    gradientLayer.frame = CGRectMake(0,0,100,100);//设置Frame
//    gradientLayer.position = self.center;//居中显示
    gradientLayer.mask = shapeLayer;
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    spinAnimation.fromValue = [NSNumber numberWithInt:0];
    spinAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    spinAnimation.duration = 2;
    spinAnimation.repeatCount = HUGE_VALF;
    [shapeLayer addAnimation:spinAnimation forKey:@"shapeRotateAnimation"];
    [gradientLayer addAnimation:spinAnimation forKey:@"GradientRotateAniamtion"];
    
}

@end
