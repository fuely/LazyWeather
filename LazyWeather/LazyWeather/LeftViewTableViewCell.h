//
//  LeftViewTableViewCell.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbweek;

@property (weak, nonatomic) IBOutlet UILabel *lbdays;

@property (weak, nonatomic) IBOutlet UILabel *lbweather;
@property (weak, nonatomic) IBOutlet UILabel *lbtemperature;

@end
