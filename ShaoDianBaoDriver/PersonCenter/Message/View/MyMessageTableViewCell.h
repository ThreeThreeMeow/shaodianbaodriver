//
//  MyMessageTableViewCell.h
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/29.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface MyMessageTableViewCell : UITableViewCell

-(void)setDataWithModel:(MessageModel *)model;

@end
