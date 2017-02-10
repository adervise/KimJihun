//
//  DataCenter.m
//  [1107]ValueObserving
//
//  Created by celeste on 2016. 11. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (id)sharedManager {
    static DataCenter * dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    
    return dataCenter;
}


- (BOOL)saveProfile:(NSString *)gender name:(NSString *)name age:(NSString *)age hobby:(NSString *)hobby {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingString:@"ProfileList.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if (![fileManager fileExistsAtPath:filePath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ProfileList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:filePath error:nil];
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    [dic setValue:gender forKey:@"gender"];
    [dic setValue:name forKey:@"name"];
    [dic setValue:age forKey:@"age"];
    [dic setValue:hobby forKey:@"hobby"];
    
    NSLog(@"success");
    return YES;
}


@end
