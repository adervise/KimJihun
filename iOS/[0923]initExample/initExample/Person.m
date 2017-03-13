//
//  Person.m
//  initExample
//
//  Created by celeste on 2016. 9. 23..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName1:(NSString *)name isHandsome:(BOOL)isHandsome {
    
    self = [super init];
    self.name = name;
    self.isHandsome = isHandsome;
    return self;
}

- (instancetype)initWithName2:(NSString *)name isAge:(NSInteger)age{
    
    self = [super init];
    self.name = name;
    self.age = age;
    return self;

}
//이름, 도시 초기화
- (instancetype)initWithName3:(NSString *)name myCity:(NSString *)city{
    
    self = [super init];
    self.name = name;
    self.city = city;
    return self;
    
}

//나이, 도시, 성별
- (instancetype)initWithName4:(NSString *)name myCity:(NSString *)city gender:(NSString *)gender {
    
    self = [super init];
    self.name = name;
    self.city = city;
    self.gender = gender;
    return self;
}
@end
