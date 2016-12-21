//
//  MBProgressHUD+Extension.h
//  PrivateContact
//
//  Created by James on 12/30/14.
//  Copyright (c) 2014 James. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Extension)



+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showFleetingMsg:(NSString *)msg;
+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (void)hideHUD;


//+ (void)showFleetingMsg:(NSString *)msg img:(UIImage *)img;

//- (void)showLoadingMsg:(NSString *)msg;

//- (void)showFleetingMsg:(NSString *)msg;

//- (void)showFleetingMsg:(NSString *)msg img:(UIImage *)img;

//+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
//+ (void)showError:(NSString *)error toView:(UIView *)view;

//+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

//+ (MBProgressHUD *)showLoadingMsg:(NSString *)msg;

//+ (void)hideHUDForView:(UIView *)view;

@end
