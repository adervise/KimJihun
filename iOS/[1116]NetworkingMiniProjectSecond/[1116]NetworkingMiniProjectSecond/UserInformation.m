//
//  UserInformation.m
//  [1116]NetworkingMiniProjectSecond
//
//  Created by celeste on 2016. 11. 16..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

+ (id)sharedUserInfo {
    
    static UserInformation *object = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        object = [[UserInformation alloc] init];
    });
    return object;
}

@end
