//
//  Person.m
//  StructureExample2
//
//  Created by celeste on 2016. 9. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Person.h"


@implementation Person

//talk 메소드 호출
- (id)talk {
    NSLog(@"안녕하세요 저는 말합니다. ");
    return nil;
}

//eat:food 호출
- (id)eat:(id)food {
    NSLog(@"%@를 먹습니다.", food);
    return nil;
}

/**
 * author jihunKim
 * @desc 사람을 나타내는 클래스 입니다.
 * @version 0.1
 */
- (id)run {
    Person *me = [[Person alloc] init];
    me.name = @"jiHun";
    me.age = @219;
    NSLog(@"안녕하세요 저는 달립니다. 제 이름은 %@ 이구요, 나이는 %@ 인데 잘 달립니다." ,me.name ,me.age);
    return nil;
}

// (id)runTo:(id)you 매개변수 받는 메소드 호출
- (id)runTo:(id)you {
    Person *mi = [[Person alloc] init];
    mi.name = @"jiHun";
    mi.age = @219;

    NSLog(@"%@를 호출합니다", you);
    return mi.age;
}

// (id)runTo:(id)location bySpeed:(id)speed 복수의 매개변수 받는 메소드 호출
- (id)runTo:(id)location bySpeed:(id)speed {
    NSLog(@"1.location:%@ 2.speed:%@ ", location, speed);
    return nil;
}

// (id)runTo:(id)location bySpeed:(id)speed with:(id)someone 복수의 매개변수 받는 메소드 호출
- (id)runTo:(id)location bySpeed:(id)speed with:(id)someone {
    NSLog(@"1.location:%@ 2.speed:%@ 3.someone:%@ 호출합니다", location, speed, someone);
    return nil;
}

@end
