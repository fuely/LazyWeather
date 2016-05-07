//
//  FirstCollectionCell.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "FirstCollectionCell.h"
#import "WeatherDelegate.h"

@implementation FirstCollectionCell
{
    WeatherDelegate *weatherDelegate;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    weatherDelegate = [[WeatherDelegate alloc]init];
    [weatherDelegate readTodayWeatherDictionary];
    NSString *items1Title = [[NSString alloc] initWithFormat:@"%@/%@",weatherDelegate.days,weatherDelegate.week];
    [self setBackgroundImg];
    self.centerToolBar.items[1].title = items1Title;
    self.centerToolBar.items[1].tintColor = [UIColor whiteColor];
    self.centerToolBar.items[3].title = weatherDelegate.citynm;
    self.centerToolBar.items[3].tintColor = [UIColor whiteColor];
    self.heartBtn = [[UIButton alloc]initWithFrame:CGRectMake(285, 167, 24, 24)];
    [self.heartBtn setImage:[UIImage imageNamed:@"heart"] forState:UIControlStateNormal];
    [self.heartBtn addTarget:self action:@selector(heartClick:) forControlEvents:UIControlEventTouchUpInside];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animate) userInfo:nil repeats:true];
    [self addSubview:self.heartBtn];
    [self addItems:self withAddOfNumber:0];
}

//小爱心事件
- (void)heartClick:(id)sender{
    
}

- (void)animate{
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.fromValue = [NSNumber numberWithFloat:1.0];
    pulse.toValue = [NSNumber numberWithFloat:1.4];
    pulse.duration = 0.3;
    pulse.autoreverses = YES;
    pulse.fillMode = kCAFillModeForwards;
    [self.heartBtn.layer addAnimation:pulse forKey:@"pulse"];
}

# define btntag 100
# define lbtag  200
- (void)addItems:(UICollectionViewCell *)cell withAddOfNumber:(int)number{
    
    for (int i = 0; i<15; i++) {
        
        UIButton* btnItem = [[UIButton alloc]init];
        UILabel* lbtitle = [[UILabel alloc]init];
        if (i<4+number) {
            float x = 80 + i%2*(120 +20);
            float y = 500 + i/2*(120 +80);
            btnItem.frame = CGRectMake(x, y,80, 80);
            lbtitle.frame = CGRectMake(x-20, y+80, 120, 40);
            lbtitle.textColor = [UIColor whiteColor];
            lbtitle.textAlignment = NSTextAlignmentCenter;
            btnItem.tintColor = [UIColor whiteColor];
            lbtitle.tag = i+1+lbtag;
            btnItem.tag = i+1+btntag;
            [cell addSubview:btnItem];
            [cell addSubview:lbtitle];
        }
        else
        {
            float x = 80 + i%2*(80 +60);
            float y = 500 + i/2*(80 +120);
            btnItem.frame = CGRectMake(x, y,80, 80);
            lbtitle.frame = CGRectMake(x-20, y+80, 120, 40);
            lbtitle.textColor = [UIColor whiteColor];
            lbtitle.textAlignment = NSTextAlignmentCenter;
            btnItem.tintColor = [UIColor whiteColor];
            lbtitle.tag = i+1+lbtag;
            btnItem.tag = i+1+btntag;
        }
    }
    UIButton* itemsImg = [[UIButton alloc]init];
    UILabel* itemslb = [[UILabel alloc]init];
    
    itemsImg = (UIButton *)[cell viewWithTag:1+btntag];
    [itemsImg setImage:[UIImage imageNamed:[NSString stringWithFormat:@"w%@",weatherDelegate.weatidicon]] forState:UIControlStateNormal];
    itemslb = (UILabel *)[cell viewWithTag:1+lbtag];
    itemslb.text = weatherDelegate.weatidnm;
    
    itemsImg = (UIButton *)[cell viewWithTag:2+btntag];
    [itemsImg setTitle:weatherDelegate.tempCurr forState:UIControlStateNormal];
    itemsImg.titleLabel.font = [UIFont boldSystemFontOfSize:60];
    itemslb = (UILabel *)[cell viewWithTag:2+lbtag];
    itemslb.text = weatherDelegate.temperature;
    
    
    [weatherDelegate readAqiDictionary];
    
    itemsImg = (UIButton *)[cell viewWithTag:3+btntag];
    [itemsImg setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pm25_%@",weatherDelegate.aqilevid]] forState:UIControlStateNormal];
    itemslb = (UILabel *)[cell viewWithTag:3+lbtag];
    itemslb.text = [NSString stringWithFormat:@"空气 %@",weatherDelegate.aqilevnm];
    
    itemsImg = (UIButton *)[cell viewWithTag:number+4+btntag];
    [itemsImg setImage:[UIImage imageNamed:@"add_element"] forState:UIControlStateNormal];
    itemslb = (UILabel *)[cell viewWithTag:number+4+lbtag];
    itemslb.text = @"添加更多";
    
    
}

//根据天气设置图片
- (void) setBackgroundImg
{
    switch ([weatherDelegate.weatid intValue]) {
        case 1:
            self.centerImg.image = [UIImage imageNamed:@"qlsy_normal"];
            break;
        case 2:
            self.centerImg.image = [UIImage imageNamed:@"qjdy_normal"];
            break;
        case 3:
            self.centerImg.image = [UIImage imageNamed:@"yymb_normal"];
            break;
        case 4:
            self.centerImg.image = [UIImage imageNamed:@"oyzy_normal"];
            break;
        case 5:
            self.centerImg.image = [UIImage imageNamed:@"dsly_normal"];
            break;
        case 6:
            self.centerImg.image = [UIImage imageNamed:@"zybb_normal"];
            break;
        case 7:
            self.centerImg.image = [UIImage imageNamed:@"xyjx_normal"];
            break;
        case 8:
            self.centerImg.image = [UIImage imageNamed:@"xymm_normal"];
            break;
        case 9:
            self.centerImg.image = [UIImage imageNamed:@"zyjl_normal"];
            break;
        case 10:
            self.centerImg.image = [UIImage imageNamed:@"dyqp_normal"];
            break;
        case 11:
            self.centerImg.image = [UIImage imageNamed:@"bylx_normal"];
            break;
        case 12:
            self.centerImg.image = [UIImage imageNamed:@"bylx_normal"];
            break;
        case 13:
            self.centerImg.image = [UIImage imageNamed:@"bylx_normal"];
            break;
        case 14:
            self.centerImg.image = [UIImage imageNamed:@"oyjx_normal"];
            break;
        case 15:
            self.centerImg.image = [UIImage imageNamed:@"lxxx_normal"];
            break;
        case 16:
            self.centerImg.image = [UIImage imageNamed:@"mtbx_normal"];
            break;
        case 17:
            self.centerImg.image = [UIImage imageNamed:@"mtbx_normal"];
            break;
        case 18:
            self.centerImg.image = [UIImage imageNamed:@"bxlx_normal"];
            break;
        case 19:
            self.centerImg.image = [UIImage imageNamed:@"wqlz_normal"];
            break;
        case 20:
            self.centerImg.image = [UIImage imageNamed:@"dyjl_normal"];
            break;
        case 21:
            self.centerImg.image = [UIImage imageNamed:@"scxj_normal"];
            break;
        case 22:
            self.centerImg.image = [UIImage imageNamed:@"zyjl_normal"];
            break;
        case 23:
            self.centerImg.image = [UIImage imageNamed:@"dyqp_normal"];
            break;
        case 24:
            self.centerImg.image = [UIImage imageNamed:@"bylx_normal"];
            break;
        case 25:
            self.centerImg.image = [UIImage imageNamed:@"bylx_normal"];
            break;
        case 26:
            self.centerImg.image = [UIImage imageNamed:@"bylx_normal"];
            break;
        case 27:
            self.centerImg.image = [UIImage imageNamed:@"mtbx_normal"];
            break;
        case 28:
            self.centerImg.image = [UIImage imageNamed:@"mtbx_normal"];
            break;
        case 29:
            self.centerImg.image = [UIImage imageNamed:@"bxlx_normal"];
            break;
        case 30:
            self.centerImg.image = [UIImage imageNamed:@"fcfy_normal"];
            break;
        case 31:
            self.centerImg.image = [UIImage imageNamed:@"fcfy_normal"];
            break;
        case 32:
            self.centerImg.image = [UIImage imageNamed:@"scxj_normal"];
            break;
        case 33:
            self.centerImg.image = [UIImage imageNamed:@"kqwr_normal"];
            break;
        default:
            break;
    }
    if ([weatherDelegate.tempCurr intValue]>30) {
        self.centerImg.image = [UIImage imageNamed:@"jrgw_normal"];
    }
    if ([weatherDelegate.tempCurr intValue]<15) {
        self.centerImg.image = [UIImage imageNamed:@"wdzj_normal"];
    }
    [weatherDelegate readAqiDictionary];
    if ([weatherDelegate.aqi intValue]>100) {
        self.centerImg.image = [UIImage imageNamed:@"qdwr100_normal"];
    }
    if ([weatherDelegate.aqi intValue]>150) {
        self.centerImg.image = [UIImage imageNamed:@"zdwr150_normal"];
    }
    if ([weatherDelegate.aqi intValue]>200) {
        self.centerImg.image = [UIImage imageNamed:@"zdwr200_normal"];
    }
    if ([weatherDelegate.aqi intValue]>300) {
        self.centerImg.image = [UIImage imageNamed:@"jzwr300_normal"];
    }
    if ([weatherDelegate.aqi intValue]<50 && [weatherDelegate.weatid intValue] == 2) {
        self.centerImg.image = [UIImage imageNamed:@"wycx_normal"];
    }

}



@end
