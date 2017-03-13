//
//  UserInformation.h
//  InfoObserving
//
//  Created by JoSeongGyu on 2016. 11. 7..
//  Copyright © 2016년 Jo Seong Gyu. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSNotificationName const DidChangeHobbyValueNotification = @"DidChangedHobby";

@interface UserInformation : NSObject

+ (instancetype)sharedUserInfo;

@property NSString *userId;
@property NSString *userPassword;
@property NSString *lastName;
@property NSString *firstName;
@property (readonly) NSString *fullName;
@property NSString *age;
@property NSString *hobby;

@end
