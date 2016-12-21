//
//  RobTableViewCell.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/17.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "RobTableViewCell.h"

@interface RobTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *from_city;
@property (weak, nonatomic) IBOutlet UILabel *to_city;
@property (weak, nonatomic) IBOutlet UILabel *from_location;
@property (weak, nonatomic) IBOutlet UILabel *to_location;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation RobTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.btn.clipsToBounds = YES;
    self.btn.layer.cornerRadius = 65/2;
    self.btn.layer.borderWidth = 4;
    self.btn.layer.borderColor = [UIColor colorWithRed:0.92 green:0.59 blue:0.50 alpha:1.00].CGColor;
    self.colorView.clipsToBounds = YES;
    self.colorView.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
