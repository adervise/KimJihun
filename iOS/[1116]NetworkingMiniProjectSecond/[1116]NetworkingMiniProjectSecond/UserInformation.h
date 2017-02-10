//
//  UserInformation.h
//  [1116]NetworkingMiniProjectSecond
//
//  Created by celeste on 2016. 11. 16..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

@property NSString *userId;
@property NSArray *imageInfoList;

+ (id)sharedUserInfo;

@end
