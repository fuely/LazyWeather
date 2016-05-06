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

@implementation WeatherData

- (void)startRequest
{
    LocalData *saveData = [LocalData sharedManager];
    NSURL *URL = [NSURL URLWithString:@"http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:0];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    
    URL = [NSURL URLWithString:@"http://api.k780.com:88/?app=weather.wtype&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"];
    manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:1];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    
    URL = [NSURL URLWithString:@"http://api.k780.com:88/?app=weather.pm25&weaid=1&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"];
    manager = [AFHTTPSessionManager manager];
    
    [manager GET:URL.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"result"];
        [saveData saveDataWithArray:dataArray dataAtIndex:2];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];


}

@end
