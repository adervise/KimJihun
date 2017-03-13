//
//  Student.m
//  initExample
//
//  Created by celeste on 2016. 9. 23..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name myCity:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade {
    
    self = [super initWithName3:name myCity:city];
    self.school = school;
    self.grade = grade;
    
    return self;
}


- (instancetype)initWithName:(NSString *)name myCity:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade credit:(NSString *)credit {
    
    self = [self initWithName:name myCity:city schoolName:school grade:grade];
    self.credit = credit;
    
    return self;
}

@end
