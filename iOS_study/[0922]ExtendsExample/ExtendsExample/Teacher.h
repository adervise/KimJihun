//
//  Teacher.h
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Person.h"
#import "Student.h"

@interface Teacher : Person

@property NSString *subject;

- (id)teach:(Student *)someone;


@end
