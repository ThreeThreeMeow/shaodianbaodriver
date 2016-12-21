//
//  RobDetailViewController.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/17.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "RobDetailViewController.h"

@interface RobDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UIView *viewStatus;
@property (weak, nonatomic) IBOutlet UILabel *statusLab;
@property (weak, nonatomic) IBOutlet UILabel *from_location;
@property (weak, nonatomic) IBOutlet UILabel *to_location;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;
@property (weak, nonatomic) IBOutlet UIButton *btnCannel;
@property (weak, nonatomic) IBOutlet UILabel *personNumLab;
@property (weak, nonatomic) IBOutlet UILabel *peiceLab;


@end

@implementation RobDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.btnSure.clipsToBounds = YES;
    self.btnSure.layer.cornerRadius = 50;
    self.btnSure.layer.borderWidth = 4;
    self.btnSure.layer.borderColor = [UIColor colorWithRed:0.92 green:0.59 blue:0.51 alpha:1.00].CGColor;
    
    self.btnCannel.clipsToBounds = YES;
    self.btnCannel.layer.cornerRadius = 40;
    self.btnCannel.layer.borderWidth = 4;
    self.btnCannel.layer.borderColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00].CGColor;
    
    self.headerImage.clipsToBounds = YES;
    self.headerImage.layer.cornerRadius = 30;
    self.headerImage.layer.borderWidth = 4;
    self.headerImage.layer.borderColor = [UIColor colorWithRed:0.98 green:0.75 blue:0.67 alpha:1.00].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
