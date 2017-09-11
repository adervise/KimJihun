//
//  UserInformation.m
//  [1115]NetworkingMiniProject
//
//  Created by celeste on 2016. 11. 15..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "UserInformation.h"
#import "ViewController.h"

@implementation UserInformation

+ (id)sharedManager {
    
    static UserInformation *instatnce = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instatnce = [[self alloc] init];
    });
    return instatnce;
}


- (void)setting:(NSString *)myID {
    NSLog(@"myID : %@",myID);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myID forKey:@"userID"];
    [defaults synchronize];
}

@end
