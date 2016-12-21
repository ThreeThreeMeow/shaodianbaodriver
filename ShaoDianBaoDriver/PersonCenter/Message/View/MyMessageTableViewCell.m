//
//  MyMessageTableViewCell.m
//  ShaoDianBao
//
//  Created by xin yang on 2016/10/29.
//  Copyright © 2016年 xin yang. All rights reserved.
//

#import "MyMessageTableViewCell.h"


@interface MyMessageTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *messageLab;

@end

@implementation MyMessageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDataWithModel:(MessageModel *)model {
    self.timeLab.text = model.time;
    self.messageLab.text = model.message;
}

@end
