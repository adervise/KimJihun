//
//  UserInformation.m
//  ImageNetworking
//
//  Created by JoSeongGyu on 2016. 11. 9..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation
+ (instancetype)sharedUserInfo {
    
    static UserInformation *object = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        object = [[UserInformation alloc] init];
    });
    
    return object;
}
@end
