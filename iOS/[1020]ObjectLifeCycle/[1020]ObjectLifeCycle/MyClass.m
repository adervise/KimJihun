//
//  MyClass.m
//  [1020]ObjectLifeCycle
//
//  Created by celeste on 2016. 10. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

+ (instancetype) alloc {
    NSLog(@"My Class instance alloc");
    return [super alloc];
}

- (instancetype) init {
    NSLog(@"MY class instacne init");
    return [super init];
}

- (void) dealloc {
    NSLog(@"My Class instance dealloc");
}

@end
