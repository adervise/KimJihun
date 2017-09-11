//
//  MySingleton.m
//  [1031]PrecompiledHeaderExample
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton


+ (instancetype)sharedInstance {

    static MySingleton *instatnce = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instatnce = [[self alloc] init];
    });
    return instatnce;
}

- (void)justMethod {
    NSLog(@"just Log");
}


@end
