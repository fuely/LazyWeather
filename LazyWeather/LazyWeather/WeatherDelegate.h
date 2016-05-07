//
//  WeatherDelegate.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/5.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDelegate : NSObject

@property (nonatomic,assign) NSArray *weatherArry;
@property (nonatomic,assign) NSDictionary *weatherDic;
@property (nonatomic,assign) NSArray *weatidArray;
@property (nonatomic,assign) NSDictionary *airDic;

@property (nonatomic,assign) NSString *cityid;
@property (nonatomic,assign) NSString *citynm;
@property (nonatomic,assign) NSString *days;
@property (nonatomic,assign) NSString *humidity;
@property (nonatomic,assign) NSString *tempCurr;
@property (nonatomic,assign) NSString *tempHigh;
@property (nonatomic,assign) NSString *tempLow;
@property (nonatomic,assign) NSString *temperature;
@property (nonatomic,assign) NSString *weaid;
@property (nonatomic,assign) NSString *weather;
@property (nonatomic,assign) NSString *weatid;
@property (nonatomic,assign) NSString *weatidnm;
@property (nonatomic,assign) NSString *weatidicon;
@property (nonatomic,assign) NSString *week;
@property (nonatomic,assign) NSString *wind;
@property (nonatomic,assign) NSString *windid;
@property (nonatomic,assign) NSString *winp;
@property (nonatomic,assign) NSString *winpid;


@property (nonatomic,assign) NSString *aqi;
@property (nonatomic,assign) NSString *aqilevid;
@property (nonatomic,assign) NSString *aqilevnm;
@property (nonatomic,assign) NSString *aqiremark;




- (NSArray *) readWeatherArrayAtIndex:(int)index;
- (NSDictionary *) readArrayDicAtIndex:(int)index;
- (NSDictionary *) readTodayWeatherDictionary;
- (NSDictionary *) readAqiDictionary;
- (NSDictionary *) readYesterdayWeatherDictionary;

@end
