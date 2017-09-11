//
//  DataCenter.m
//  [1102]ProjectLoginPage
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "DataCenter.h"
#import "SignUpController.h"

@implementation DataCenter

+ (id)sharedManager {
    
    static DataCenter *instatnce = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instatnce = [[self alloc] init];
    });
    return instatnce;
}

- (BOOL)joinUserID:(NSString *)userID userPW:(NSString *)userPW {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userID forKey:@"userID"];
    [defaults setObject:userPW forKey:@"userPW"];
    [defaults synchronize];
    NSLog(@"NSUserDefaults %@, %@ 저장 완료!!!",userID,userPW);
    return YES;
}


- (BOOL)haveUserID:(NSString *)userID userPW:(NSString *)userPW {
    
    NSString *idData = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    NSString *pwData = [[NSUserDefaults standardUserDefaults] stringForKey:@"userPW"];
    
    if ([idData isEqualToString:userID] && [pwData isEqualToString:userPW]) {
        NSLog(@"Success");
        return YES;
    } else {
        NSLog(@"Failed");
        return NO;
    }
}
@end
