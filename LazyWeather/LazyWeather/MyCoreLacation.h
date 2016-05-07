//
//  MyCoreLacation.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/6.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>
@interface MyCoreLacation : NSObject<CLLocationManagerDelegate>
@property (strong,nonatomic) CLLocationManager *locationManager;
@property(nonatomic, strong)  CLLocation *currLocation;
-(void)myLacationManager;

@end
