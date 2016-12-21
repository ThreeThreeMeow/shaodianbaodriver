//
//  Setting.h
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/15.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#ifndef Setting_h
#define Setting_h

#define WIDTH             [UIScreen mainScreen].bounds.size.width
#define HEIGHT            [UIScreen mainScreen].bounds.size.height
#define STRING_DICT(aaa)  [NSString stringWithFormat:@"%@",aaa]
#define AUTH              [[NSUserDefaults standardUserDefaults] objectForKey:@"auth"]

#endif /* Setting_h */
