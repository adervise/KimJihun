//
//  CalculrationSubject.m
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "CalculrationSubject.h"


@implementation CalculrationSubject

- (instancetype)init {
    self = [super init];
    if (self) {
        self.subjectCount = 0;
        self.totalScore = 0;
    }
    return self;
}

// 점수를 받아서 토탈변수에 더한다.
// 더해진 점수마다 과목 카운트를 하나씩 올린다.
- (void) addScore:(NSInteger)score {
    self.totalScore = self.totalScore + score;
    self.subjectCount = self.subjectCount + 1;
}

// 평균을 구해서 반환해 준다.
- (CGFloat)average {
    CGFloat averageTemp = (CGFloat)self.totalScore / (CGFloat)self.subjectCount;
    return averageTemp;
}

@end
