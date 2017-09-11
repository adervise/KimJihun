//
//  Person.h
//  [0927]StructExample
//
//  Created by celeste on 2016. 9. 27..
//  Copyright © 2016년 iosSchool. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef struct character {
    CGFloat height;
    CGFloat weight;
} character;

@interface Person : NSObject

@property NSString *name;
@property NSInteger age;
@property character info;

@end
