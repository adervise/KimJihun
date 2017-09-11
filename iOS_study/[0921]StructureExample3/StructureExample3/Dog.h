//
//  Dog.h
//  StructureExample3
//
//  Created by celeste on 2016. 9. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cat;
@interface Dog : NSObject

@property NSString *name;
@property NSInteger age;
@property NSUInteger speed;
@property NSNumber *jumpHeight;
@property CGFloat weight;

- (id)cry;
- (id)cryTo:(Cat *)cat;

@end
