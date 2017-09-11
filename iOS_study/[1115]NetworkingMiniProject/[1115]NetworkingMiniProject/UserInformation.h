//
//  UserInformation.h
//  [1115]NetworkingMiniProject
//
//  Created by celeste on 2016. 11. 15..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

@property NSString *saveId;

+ (id)sharedManager;
- (void)setting:(NSString *)myID;

@end
