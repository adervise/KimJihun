//
//  MeasurementChange.h
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeasurementChange : NSObject

@property CGFloat inch;
@property CGFloat cm;
@property CGFloat meter;
@property CGFloat square;
@property CGFloat F;
@property CGFloat C;
@property CGFloat kb;
@property CGFloat mg;
@property CGFloat gb;

+ (CGFloat)inchToCm:(CGFloat)cm;
+ (CGFloat)cmToInch:(CGFloat)inch;
+ (CGFloat)meterToSquare:(CGFloat)square;
+ (CGFloat)squareToMeter:(CGFloat)meter;
+ (CGFloat)fToC:(CGFloat)c;
+ (CGFloat)cTof:(CGFloat)f;
+ (CGFloat)kbToMb:(CGFloat)mb;
+ (CGFloat)gbToKb:(CGFloat)gb;

@end
