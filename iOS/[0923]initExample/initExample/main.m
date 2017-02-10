//
//  main.m
//  initExample
//
//  Created by celeste on 2016. 9. 23..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {

    Person *jack = [[Person alloc] init];
    jack.name = @"김지훈";
    jack.age= 50;
    jack.mobileNumber = @"010-1234-5678";
    jack.city = @"홍콩";
    jack.isHandsome = YES;
    
    Person *rose = [[Person alloc] initWithName1:@"로즈" isHandsome:YES];
    NSLog(@"@ rose's name : %@ 잘생겼냐 ? : %d, ", rose.name, rose.isHandsome);
    
    Person *hyemi = [[Person alloc] initWithName2:@"혜미" isAge:31];
    NSLog(@"@ hyemi name : %@ 잘생겼냐 ? : %ld, ", hyemi.name, hyemi.age);
    
    Student *baby = [[Student alloc] initWithName:@"지훈" myCity:@"서울" schoolName:@"서초고" grade:3];
    NSLog(@"%@, %@, %@, %ld", baby.name, baby.city, baby.school, baby.grade);

    Student *babi = [[Student alloc] initWithName:@"혜미" myCity:@"서울" schoolName:@"총신대" grade:4 credit:@"졸업자"];
    NSLog(@"%@, %@, %@, %ld %@", babi.name, babi.city, babi.school, babi.grade, babi.credit);
    
    return 0;
}
