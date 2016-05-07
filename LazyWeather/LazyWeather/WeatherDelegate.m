//
//  WeatherDelegate.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/5.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "WeatherDelegate.h"
#import "LocalData.h"

@implementation WeatherDelegate

- (NSArray *) readWeatherArrayAtIndex:(int)index
{
    LocalData *localData = [LocalData sharedManager];
    _weatherArry = [localData readDataWithArrayAtIndex:index];
    return _weatherArry;
}
- (NSDictionary *) readArrayDicAtIndex:(int)index
{
    NSDictionary *weatherDic = _weatherArry[index];
    _cityid = [weatherDic valueForKey:@"cityid"];
    _citynm = [weatherDic valueForKey:@"citynm"];
    _days = [weatherDic valueForKey:@"days"];
    _humidity = [weatherDic valueForKey:@"humidity"];
    _tempCurr = [weatherDic valueForKey:@"temp_curr"];
    _tempHigh = [weatherDic valueForKey:@"temp_high"];
    _tempLow = [weatherDic valueForKey:@"temp_low"];
    _temperature = [weatherDic valueForKey:@"temperature"];
    _weaid = [weatherDic valueForKey:@"weaid"];
    _weather = [weatherDic valueForKey:@"weather"];
    _weatid = [weatherDic valueForKey:@"weatid"];
    _week = [weatherDic valueForKey:@"week"];
    _wind = [weatherDic valueForKey:@"wind"];
    _windid = [weatherDic valueForKey:@"windid"];
    _winp = [weatherDic valueForKey:@"winp"];
    _winpid = [weatherDic valueForKey:@"winpid"];
    return weatherDic;
}
- (NSDictionary *) readTodayWeatherDictionary
{
     _weatherDic =(NSDictionary *)[self readWeatherArrayAtIndex:3];
    _cityid = [_weatherDic valueForKey:@"cityid"];
    _citynm = [_weatherDic valueForKey:@"citynm"];
    _days = [_weatherDic valueForKey:@"days"];
    _humidity = [_weatherDic valueForKey:@"humidity"];
    _tempCurr = [_weatherDic valueForKey:@"temp_curr"];
    _tempHigh = [_weatherDic valueForKey:@"temp_high"];
    _tempLow = [_weatherDic valueForKey:@"temp_low"];
    _temperature = [_weatherDic valueForKey:@"temperature"];
    _weaid = [_weatherDic valueForKey:@"weaid"];
    _weather = [_weatherDic valueForKey:@"weather"];
    _weatid = [_weatherDic valueForKey:@"weatid"];
    _week = [_weatherDic valueForKey:@"week"];
    _wind = [_weatherDic valueForKey:@"wind"];
    _windid = [_weatherDic valueForKey:@"windid"];
    _winp = [_weatherDic valueForKey:@"winp"];
    _winpid = [_weatherDic valueForKey:@"winpid"];
    
    NSDictionary *weatidDic = [self readWeatherArrayAtIndex:1][[_weatid intValue]-1];
    _weatidnm = [weatidDic valueForKey:@"weather"];
    _weatidicon = [weatidDic valueForKey:@"weather_icon"];

    
    return _weatherDic;
    
}

- (NSDictionary *) readAqiDictionary
{
    LocalData *localData = [LocalData sharedManager];
    _airDic = (NSDictionary *)[localData readDataWithArrayAtIndex:2];
    _aqi = [_airDic valueForKey:@"aqi"];
    _aqilevid = [_airDic valueForKey:@"aqi_levid"];
    _aqilevnm = [_airDic valueForKey:@"aqi_levnm"];
    _aqiremark = [_airDic valueForKey:@"aqi_remark"];
    return _airDic;
}

- (NSDictionary *) readYesterdayWeatherDictionary
{
    [self readWeatherArrayAtIndex:5];
    NSDictionary *weatherDic = _weatherArry[0];
    return weatherDic;

    
}

@end
