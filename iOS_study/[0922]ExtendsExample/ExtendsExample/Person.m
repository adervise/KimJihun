//
//  Person.m
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Person.h"
#import "GameCharecter.h"

@implementation Person

- (id)select:(GameCharecter *)charecter {
    
    NSLog(@"%@ 이(가) 게임 캐릭터 %@ 클래스를 선택하였습니다.", self.name, charecter.charecterClass);
    return nil;
}

@end
