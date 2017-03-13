//
//  Person.h
//  initExample
//
//  Created by celeste on 2016. 9. 23..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSInteger age;
@property NSString *mobileNumber;
@property NSString *city;
@property BOOL isHandsome;
@property NSString *gender;


//이름 잘생겼는지 초기화
- (instancetype)initWithName1:(NSString *)name isHandsome:(BOOL)isHandsome;
//이름, 나이 초기화
- (instancetype)initWithName2:(NSString *)name isAge:(NSInteger)age;
//이름, 도시 초기화
- (instancetype)initWithName3:(NSString *)name myCity:(NSString *)city;
//나이, 도시, 성별
- (instancetype)initWithName4:(NSString *)name myCity:(NSString *)city gender:(NSString *)gender;
@end
