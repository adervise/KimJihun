//
//  Animal.h
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Animal : NSObject

@property NSString *cry;
@property NSInteger age;
@property NSString *category;
@property NSInteger legs;
@property NSString *name;

- (id)cryTo:(Person *)someone;

@end
