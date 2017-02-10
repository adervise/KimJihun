//
//  MeasurementChange.m
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "MeasurementChange.h"

@implementation MeasurementChange

+ (CGFloat)inchToCm:(CGFloat)cm {
   
    CGFloat inchToCm = cm * 2.54;
    return inchToCm;
}

+ (CGFloat)cmToInch:(CGFloat)inch {
    
    CGFloat cmToInch = inch * 0.39;
    return cmToInch;
}

+ (CGFloat)meterToSquare:(CGFloat)square {
    
    CGFloat meterToSquare = square * 0.3 ;
    return meterToSquare;
}

+ (CGFloat)squareToMeter:(CGFloat)meter {
    
    CGFloat squareToMeter = meter * 3.3;
    return squareToMeter;
}

+ (CGFloat)cTof:(CGFloat)f {
   
    CGFloat cTof =  (f - 32) / 1.8;
    return cTof;
}

+ (CGFloat)fToC:(CGFloat)c {
    
    CGFloat fToC = c * 1.8 + 32 ;
    return fToC;
}

+ (CGFloat)kbToMb:(CGFloat)mb {
    
    CGFloat kbToMb = mb * 0.00097;
    return kbToMb;
}

+ (CGFloat)gbToKb:(CGFloat)kb {
   
    CGFloat gbToKb = kb * 1048576 ;
    return gbToKb;
}

@end
