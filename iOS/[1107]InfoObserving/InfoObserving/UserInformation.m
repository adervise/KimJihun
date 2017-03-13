//
//  UserInformation.m
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

+ (instancetype)sharedUserInfo {
    static UserInformation *object = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (object == nil) {
            object = [[UserInformation alloc] init];
        }
    });
    return object;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _lastName, _firstName];
}

- (void)setHobby:(NSString *)hobby {
    _hobby = hobby;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeHobbyValueNotification object:self];
}

@end
