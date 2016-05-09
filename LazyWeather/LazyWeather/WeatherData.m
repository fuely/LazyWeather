//
//  WeatherData.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/5.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "WeatherData.h"
#import "AFNetworking.h"
#import "LocalData.h"
#import "WeatherDelegate.h"

@implementation WeatherData

- (void)startRequest
{
    WeatherDelegate *cityDelegate = [[WeatherDelegate alloc]init];
    NSDictionary *cityDic = (NSDictionary *)[cityDelegate readWeatherArrayAtIndex:6];
    _cityid = [cityDic valueForKey:@"weaid"];
    if(_cityid == nil)
    {
        _cityid = @"147";
        
    }
    LocalData *saveData = [LocalData sharedManager];
    //未来天气预报
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.k780.com:88/?app=weather.future&weaid=%@&&appkey=19237&sign=de87bcc420c6b7b2a0abc11925f36316&format=json",_cityid]];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:0];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    //天气类型
    URL = [NSURL URLWithString:@"http://api.k780.com:88/?app=weather.wtype&appkey=19237&sign=de87bcc420c6b7b2a0abc11925f36316&format=json"];
    manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:1];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    //PM2.5空气质量
    URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.k780.com:88/?app=weather.pm25&weaid=%@&appkey=19237&sign=de87bcc420c6b7b2a0abc11925f36316&format=json",_cityid]];
    manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:2];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    //实时天气情况
    URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.k780.com:88/?app=weather.today&weaid=%@&&appkey=19237&sign=de87bcc420c6b7b2a0abc11925f36316&format=json",_cityid]];
    manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:3];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    //天气预报城市列表
    URL = [NSURL URLWithString:@"http://api.k780.com:88/?app=weather.city&&appkey=19237&sign=de87bcc420c6b7b2a0abc11925f36316&format=json"];
    manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:4];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate *yesterday = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:[NSDate date]];
    NSString *currentTime = [formatter stringFromDate:yesterday];
    //获取昨天天气
    URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.k780.com:88/?app=weather.history&weaid=%@&date=%@&appkey=19237&sign=de87bcc420c6b7b2a0abc11925f36316&format=json",_cityid,currentTime]];
    manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:5];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];

}

@end
