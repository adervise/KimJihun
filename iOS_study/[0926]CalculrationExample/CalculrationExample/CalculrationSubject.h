//
//  CalculrationSubject.h
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculrationSubject : NSObject

@property NSInteger totalScore;
@property NSInteger subjectCount;

- (void) addScore:(NSInteger)score;
- (CGFloat)average;

@end
