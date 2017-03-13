//
//  DataCenter.h
//  [1102]ProjectLoginPage
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataCenter : NSObject

+ (id)sharedManager;

// 가입 정보 받기
- (BOOL)signUp:(NSString *)userID userPW:(NSString *)userPW userRePW:(NSString *)userRePW;

// plist 저장

// 가입
- (BOOL)joinUserID:(NSString *)userID userPW:(NSString *)userPW;

// 중복체크
- (BOOL)haveUserID:(NSString *)userID userPW:(NSString *)userPW;

// NSUserDefault 저장
- (void)setAutoLogin:(BOOL)flag;
- (BOOL)isAutoLongin;
- (void)setUserID:(NSString *)userID;
- (NSString *)userID;

- (void)saveUserData:(NSDictionary *)data;
- (NSArray *)loadUserData;

@end
