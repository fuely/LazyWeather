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

+ (WeatherDelegate *)readData;
- (NSArray *) readWeatherArray;
- (NSDictionary *) readWeatherDictionaryAtIndex:(int)index;
- (NSString *) readCitynm;
- (NSString *) readDays;
- (NSString *) readTempHigh;
- (NSString *) readTempLow;
- (NSString *) readTemperature;
- (NSString *) readWeather;
- (NSString *) readWeatherIcon;
- (NSString *) readWeatid;
- (NSString *) readWeatidIcon;
- (NSString *) readWeek;
- (NSString *) readWind;
- (NSString *) readWinp;
- (NSString *) readLevnm;
- (NSString *) readLevid;
- (NSString *) readRemark;
- (NSString *) readAqi;

@end
