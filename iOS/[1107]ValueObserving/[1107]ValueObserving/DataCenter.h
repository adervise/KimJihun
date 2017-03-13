//
//  DataCenter.h
//  [1107]ValueObserving
//
//  Created by celeste on 2016. 11. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (id)sharedManager;
- (BOOL)saveProfile:(NSString *)gender name:(NSString *)name age:(NSString *)age hobby:(NSString *)hobby;
@end
