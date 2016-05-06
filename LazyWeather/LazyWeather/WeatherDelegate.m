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
static WeatherDelegate *readData = nil;
+ (WeatherDelegate *)readData
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        readData = [[self alloc]init];
        [readData readWeatherArray];
        
    });
    
    return readData;
}
- (NSArray *) readWeatherArray
{
    LocalData *localData = [LocalData sharedManager];
    _weatherArry = [localData readDataWithArrayAtIndex:0];
    _weatidArray = [localData readDataWithArrayAtIndex:1];
    _airDic =(NSDictionary *) [localData readDataWithArrayAtIndex:2];
    return _weatherArry;
}
- (NSDictionary *) readWeatherDictionaryAtIndex:(int)index
{
   _weatherDic = [self readWeatherArray][index];
    return _weatherDic;
}
- (NSString *) readCitynm
{
    
    return [_weatherDic valueForKey:@"citynm"];
}

- (NSString *)readDays
{
    return [_weatherDic valueForKey:@"days"];
}
- (NSString *) readTempHigh
{
    return [_weatherDic valueForKey:@"temp_high"];
}
- (NSString *) readTempLow
{
    return [_weatherDic valueForKey:@"temp_low"];
}
- (NSString *) readTemperature
{
    return [_weatherDic valueForKey:@"temperature"];
}
- (NSString *) readWeather
{
    return [_weatherDic valueForKey:@"weather"];
}
- (NSString *) readWeatherIcon
{
    return [_weatherDic valueForKey:@"weather_icon"];
}
- (NSString *) readWeatid
{
    int index =[[_weatherDic valueForKey:@"weatid"] intValue];
    NSDictionary *weatidDic = _weatidArray[index-1];
    return [weatidDic valueForKey:@"weather"];
}
- (NSString *) readWeatidIcon
{
    int index =[[_weatherDic valueForKey:@"weatid"] intValue];
    NSDictionary *weatidDic = _weatidArray[index-1];
    return [weatidDic valueForKey:@"weather_icon"];
}
- (NSString *) readWeek
{
    return [_weatherDic valueForKey:@"week"];
}
- (NSString *) readWind
{
    return [_weatherDic valueForKey:@"wind"];
}
- (NSString *) readWinp
{
    return [_weatherDic valueForKey:@"winp"];
}

- (NSString *) readLevnm
{
    return [_airDic valueForKey:@"aqi_levnm"];
}
- (NSString *) readLevid
{
    return [_airDic valueForKey:@"aqi_levid"];

}
- (NSString *) readRemark
{
    return [_airDic valueForKey:@"aqi_remark"];
}
- (NSString *) readAqi
{
    return [_airDic valueForKey:@"aqi"];
}

@end
