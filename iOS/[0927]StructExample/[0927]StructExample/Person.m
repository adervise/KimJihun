//
//  Person.m
//  [0927]StructExample
//
//  Created by celeste on 2016. 9. 27..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {

        self.name = name;
    }
    
    return self;
}


- (void)setHeight:(CGFloat)height weight:(CGFloat)weight {
    
//    실패한 코드 클래스와 구조체의 표현이 섞임
//    self.info.height = height;
//    self.info.weight = weight;
    
    _info.height = height;
    _info.weight = weight;
    
    // 구조체인 값 height, weight 둘다 tempInfo로 보낸다.
    character tempInfo = {height, weight};
    tempInfo.height = 30;
    tempInfo.weight = 180;
    self.info = tempInfo;
}

- (character)personInfo {
    return self.info;
}

@end
