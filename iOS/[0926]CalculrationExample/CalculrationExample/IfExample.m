//
//  IfExample.m
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "IfExample.h"

@class CalculrationSubject;
@implementation IfExample

+ (BOOL)isEventNumber:(NSInteger)num {

    BOOL isEven = NO;
    if (num % 2 == 0) {
        isEven = YES;
    } else {
        isEven = NO;
    }
    return isEven;
}

+ (BOOL)isEventNumber2:(NSInteger)num {
    
    if (num % 2== 0) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSString *)pointToGrade:(CGFloat)point {
    
    NSString *grade;
    
    if (point > 100 || point < 0) {
        NSLog(@"입력오류");
        grade = @"Fail";
    } else if (point >= 95) {
        NSLog(@"A+ 입니다");
        grade = @"A+";
    } else if (point >= 90) {
        NSLog(@"A 입니다");
        grade = @"A";
    } else if (point >= 85) {
        NSLog(@"B+ 입니다");
        grade = @"B+";
    } else if (point >= 80) {
        NSLog(@"B 입니다");
        grade = @"B";
    } else if (point >= 70) {
        NSLog(@"C 입니다");
        grade = @"C";
    } else {
        NSLog(@"F입니다.");
        grade = @"F";
    }
    return grade;
}

+ (CGFloat)gradeToPoint:(NSString *)grade {
    NSInteger point;
    return point;
}

+ (void)scholarShipWithGrade:(NSInteger)grade {
    
    switch (grade) {
        case 1:
            NSLog(@"전액장학금");
            break;
        case 2:
            NSLog(@"50%% 장학금");
            break;
        case 3:
            NSLog(@"30&& 장학금");
            break;
        default:
            NSLog(@"장학금 없음");
            break;
    }
}


+ (NSInteger)monthFinalDay:(NSInteger)month {
    
    NSInteger lastDay = 0;
    
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            NSLog(@"이 달의 마지막 날은 31");
            lastDay = 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            NSLog(@"이 달의 마지막 날은 30");
            
            lastDay = 30;
            break;
        case 2:
            NSLog(@"이 달의 마지막 날은 28");
            lastDay = 28;
            break;
        default:
            NSLog(@"1월 ~ 12월 사이의 달을 입력해주세요");
            break;
    }
    return lastDay;
}


+ (NSInteger)absoluteNum:(NSInteger)num {
    
    if( num < 0) {
        num = num * -1;
    }
    NSLog(@"양수변신!! %ld", num);
    return num;
}

+ (CGFloat)roundNum:(CGFloat)num {

    num = ((num + 0.005) * 100);
    CGFloat newNum = (NSInteger)num;
    num = newNum / 100 ;
    
    return num;
    
}

+ (BOOL)yearCheck:(NSInteger)year {

    BOOL yearCheck = NO;
    
    //윤년처리 어렵게 하기
    if( year % 4 == 0 ){
        yearCheck  = YES;
        if ( year % 100 == 0){
            yearCheck = NO;
            if( year % 400 == 0 ){
                yearCheck = YES;
            }
        }
    }
    
    if (yearCheck == YES) {
        NSLog(@"입력년도는 윤년입니다.");
    } else {
        NSLog(@"입력년도는 윤년이 아닙니다.");
    }
    
    //윤년처리 간단히 하기
    if((year % 4 == 0 && year % 100 !=0) || year % 400 == 0){
        BOOL yearCheck = YES;
        NSLog(@"간단하게 처리한 윤년 입니다.");
    } else {
        BOOL yearCheck = NO;
        NSLog(@"간단하게 처리한 윤년이 아닙니다.");
    }
    return yearCheck;
}

@end
