//
//  UIImage+Image.h
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/19.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
+(UIImage *)coreBlurImage:(UIImage *)image;
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
- (UIImage *)imageBluredWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
