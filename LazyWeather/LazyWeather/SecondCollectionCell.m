//
//  SecondCollectionCell.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/3.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "SecondCollectionCell.h"
#import "WeatherDelegate.h"

@implementation SecondCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        WeatherDelegate *weatherDelegate = [[WeatherDelegate alloc]init];
        [weatherDelegate readAqiDictionary];
        
        self.backgroundColor = [UIColor whiteColor];
        _toplb = [[UILabel alloc]initWithFrame:CGRectMake(40, 40, 120, 40)];
        _toplb.text =[NSString stringWithFormat:@"空气 %@>",weatherDelegate.aqilevnm];
        _toplb.font = [UIFont boldSystemFontOfSize:25];
        [self addSubview:_toplb];
        
        _setBtn = [[UIButton alloc]initWithFrame:CGRectMake(315, 45, 25, 25)];
        [_setBtn setImage:[UIImage imageNamed:@"lanmuselect@2x_normal"] forState:UIControlStateNormal];
        [self addSubview:_setBtn];
        
        _airView = [[UILabel alloc]initWithFrame:CGRectMake(40, 120, 100, 100)];
        _airView.text = weatherDelegate.aqi;
        _airView.font = [UIFont boldSystemFontOfSize:80];
        [self addSubview:_airView];
        
        NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH"];
        NSString *currentTime = [formatter stringFromDate:[NSDate date]];
        _airText = [[UILabel alloc]initWithFrame:CGRectMake(150, 120, 120, 60)];
        _airText.lineBreakMode = NSLineBreakByWordWrapping;
        _airText.numberOfLines = 0;
        NSString *str1 = @"空气质量指数";
        NSString *str2 = [str1 stringByAppendingString:currentTime];
        NSString *str3 = @":00发布";
        NSString *str = [str2 stringByAppendingString:str3];
        _airText.text =str;
        [self addSubview:_airText];

        _volumeBar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"volumebar"]];
        _volumeBar.frame = CGRectMake(40, 240, 275, 60);
        _volumePoint = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"volumepoint"]];
        _volumePoint.frame = CGRectMake(57*250/500, 0, 20, 20);
        [_volumeBar addSubview:_volumePoint];
        [self addSubview:_volumeBar];
        
        _airlb = [[UILabel alloc]initWithFrame:CGRectMake(40, 330, 280, 60)];
        _airlb.text = weatherDelegate.aqiremark;
        _airlb.lineBreakMode = NSLineBreakByWordWrapping;
        _airlb.numberOfLines = 0;
        [self addSubview:_airlb];
        
        _pm10 = [[UILabel alloc]initWithFrame:CGRectMake(40, 450, 200, 20)];
        _pm2 = [[UILabel alloc]initWithFrame:CGRectMake(40, 470, 200, 20)];
        _no2 = [[UILabel alloc]initWithFrame:CGRectMake(40, 490, 200, 20)];
        _so2 = [[UILabel alloc]initWithFrame:CGRectMake(40, 510, 200, 20)];
        _o3 = [[UILabel alloc]initWithFrame:CGRectMake(40, 530, 200, 20)];
        _co = [[UILabel alloc]initWithFrame:CGRectMake(40, 550, 200, 20)];
        
        _pm10.text = [NSString stringWithFormat:@"PM10/可吸收入颗粒物:%@",weatherDelegate.aqi];
        _pm2.text = [NSString stringWithFormat:@"PM2.5/入肺颗粒物:%@",weatherDelegate.aqi];
        _no2.text = @"NO2/二氧化氮:35";
        _so2.text = @"SO2/二氧化硫:9";
        _o3.text = @"O3/臭氧:80";
        _co.text = @"CO/一氧化碳:6";
        [self addSubview:_pm10];
        [self addSubview:_pm2];
        [self addSubview:_no2];
        [self addSubview:_so2];
        [self addSubview:_o3];
        [self addSubview:_co];
        
        
    }
    return self;
}


@end
