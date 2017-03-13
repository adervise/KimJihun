//
//  DimensionalShapes.m
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "DimensionalShapes.h"


@implementation DimensionalShapes


- (NSInteger)squareArea:(NSInteger)length {
    
    NSInteger result = length * length;
    NSLog(@"사각형의 넓이는 %ld 입니다.", result);
    return length * length;
}

- (NSInteger)squarePrimeter:(NSInteger)length {
    
    NSInteger result = 4 * length;
    NSLog(@"사각형의 둘레는 %ld 입니다.", result);
    return 4 * length;
}

- (NSInteger)rectangleArea:(NSInteger)height width:(NSInteger)width {
   
    NSInteger result = height * width;
    NSLog(@"직사각형의 넓이는 %ld 입니다.", result);
    return height * width;
}

- (NSInteger)rectanglePrimeter:(NSInteger)height width:(NSInteger)width {
    
    NSInteger result = (2 * height) + (2 * width);
    NSLog(@"직사각형의 둘레는 %ld 입니다.", result);
    return (2 * height) + (2 * width);
}

- (NSInteger)circleArea:(NSInteger)radius pi:(CGFloat)pi {
    
    CGFloat result = pi * (radius * radius);
    NSLog(@"원의 넓이는 %lf 입니다.", result);
    return pi * (radius * radius);
    
}

- (NSInteger)circlePrimeter:(NSInteger)radius pi:(CGFloat)pi {
    
    CGFloat result = 2 * pi * radius;
    NSLog(@"원의 둘래는 %lf 입니다.", result);
    return 2 * pi * radius;
}

- (NSInteger)triangleArea:(NSInteger)base height:(NSInteger)height {
    
    NSInteger result = (base * height / 2);
    NSLog(@"사각형의 넓이는 %ld 입니다.", result);
    return (base * height / 2);
}

- (NSInteger)trapezoid:(NSInteger)height base:(NSInteger)base top:(NSInteger)top {
    
    NSInteger result = height / 2  * (top + base);
    NSLog(@"사다리꼴의 넓이는 %ld 입니다.", result);
    return height / 2  * (top + base);
}

- (NSInteger)cube:(NSInteger)length {
    
    NSInteger result = length * length * length;;
    NSLog(@"큐브의 넓이는 %ld 입니다.", result);
    return length * length * length;
}

- (NSInteger)rectangularSolid:(NSInteger)height width:(NSInteger)width length:(NSInteger)length {
    
    NSInteger result = height * width * length;
    NSLog(@"기다란 큐브의 넓이는 %ld 입니다.", result);
    return height * width * length;
}

- (NSInteger)circuralCylender:(CGFloat)pi radius:(NSInteger)radius height:(NSInteger)height {
    
    CGFloat result = pi * radius * radius * height;
    NSLog(@"원통의 넓이는 %lf 입니다.", result);
    return pi * radius * radius * height;
}

- (NSInteger)sphere:(CGFloat)pi radius:(NSInteger)radius {

    CGFloat result  = pi * (radius * radius * radius) / 3 * 4;
    NSLog(@"구의 넓이는 %lf 입니다.", result);
    return pi * (radius * radius * radius) / 3 * 4;
}

- (NSInteger)cone:(CGFloat)pi radius:(NSInteger)radius height:(NSInteger)height {
    CGFloat result = pi * radius * radius * height / 3;
    NSLog(@"삼각뿔의 넓이는 %lf 입니다.", result);
    return pi * radius * radius * height / 3;
}


@end
