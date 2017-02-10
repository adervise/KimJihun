//
//  IfExample.h
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class CalculrationSubject;
@interface IfExample : NSObject

@property NSString *grade;
@property CGFloat point;

+ (BOOL)isEventNumber:(NSInteger)num;
+ (NSString *)pointToGrade:(CGFloat)point;
+ (CGFloat)gradeToPoint:(NSString *)grade;
+ (void)scholarShipWithGrade:(NSInteger)grade;
+ (NSInteger)monthFinalDay:(NSInteger)month;
+ (NSInteger)absoluteNum:(NSInteger)num;
+ (CGFloat)roundNum:(CGFloat)num ;
+ (BOOL)yearCheck:(NSInteger)year;


@end
