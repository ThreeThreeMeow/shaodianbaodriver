//
//  MessageModel.h
//  ShaoDianBao
//
//  Created by 光小星 on 2016/11/11.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic,copy)NSString *message;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,copy)NSString *order_id;
@property (nonatomic,copy)NSString *title;

@end
