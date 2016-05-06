//
//  LocalData.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/5.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "LocalData.h"

@implementation LocalData
static LocalData *sharedManager = nil;

+ (LocalData *)sharedManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        sharedManager = [[self alloc] init];
        [sharedManager createEditableCopyOfDatabaseIfNeeded];
    });
    return sharedManager;
}
-(void)saveDataWithArray:(NSArray *)array dataAtIndex:(int)index
{
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithContentsOfFile:path];
    mArray[index] = array;
    [mArray writeToFile:path atomically:YES];
}
-(NSMutableArray *)readDataWithArrayAtIndex:(int)index
{
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    return array[index];
}
-(void)saveDataWithString:(NSString *)string dataAtIndex:(int)index
{
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    array[index] = string;
    [array writeToFile:path atomically:YES];
}
-(NSString *)readDataWithStringAtIndex:(int)index
{
    NSString *path = [self applicationDocumentsDirectoryFile];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    return array[index];
}

- (void)createEditableCopyOfDatabaseIfNeeded {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *writableDBPath = [self applicationDocumentsDirectoryFile];
    
    BOOL dbexits = [fileManager fileExistsAtPath:writableDBPath];
    if (!dbexits) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"LocalDataList.plist"];
        
        NSError *error;
        BOOL success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        NSAssert(success, @"错误写入文件");
    }
}

- (NSString *)applicationDocumentsDirectoryFile {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"LocalDataList.plist"];
//    NSLog(@"%@",path);
    
    return path;
}


@end
