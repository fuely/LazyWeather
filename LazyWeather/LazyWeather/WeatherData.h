//
//  WeatherData.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/5.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (strong,nonatomic)NSString *cityid;
-(void)startRequest;

@end
