//
//  MySingleton.h
//  [1031]PrecompiledHeaderExample
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

+ (instancetype)sharedInstance;
- (void)justMethod;

@end
