//
//  HJLocation.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/6.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface HJLocation : NSObject<CLLocationManagerDelegate>
@property (strong,nonatomic) CLLocationManager *locationManager;

@end
