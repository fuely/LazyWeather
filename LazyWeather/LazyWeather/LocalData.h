//
//  LocalData.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/5.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalData : NSObject

+ (LocalData *)sharedManager;
-(void)saveDataWithArray:(NSArray *)array dataAtIndex:(int)index;
-(NSMutableArray *)readDataWithArrayAtIndex:(int)index;
-(void)saveDataWithString:(NSString *)string dataAtIndex:(int)index;
-(NSString *)readDataWithStringAtIndex:(int)index;

@end
