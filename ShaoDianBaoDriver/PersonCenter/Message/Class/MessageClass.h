//
//  MessageClass.h
//  ShaoDianBao
//
//  Created by 光小星 on 2016/11/11.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageClass : NSObject

-(void)insertDataWithMessage:(NSString *)message WithType:(NSString *)type WithID:(NSString *)orderId WithTitle:(NSString *)title;
-(NSMutableArray *)SelectData;
-(void)deleteData;

@end
