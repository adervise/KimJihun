//
//  main.m
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculrationSubject.h"
#import "DimensionalShapes.h"
#import "MeasurementChange.h"
#import "IfExample.h"

int main(int argc, const char * argv[]) {
    
    // 1. 계산 객체 생성 및 함수 호출
    CalculrationSubject *cal = [[CalculrationSubject alloc] init];
    [cal addScore:100];
    [cal addScore:91];
    [cal addScore:99];
    CGFloat average = [cal average];
    NSLog(@"나의 평균은 %lf 입니다.",average);
    
    
    // 2. 도형넓이 공식 객체 생성 및 함수 호출, 파이는 고정값으로 지정
    DimensionalShapes *shape = [[DimensionalShapes alloc] init];
    shape.pi = 3.14;
    
    [shape squareArea:4];
    [shape rectangleArea:4 width:5];
    [shape rectanglePrimeter:4 width:5];
    [shape circleArea:1 pi:shape.pi];
    [shape circlePrimeter:2 pi:shape.pi];
    [shape triangleArea:7 height:12];
    [shape trapezoid:23 base:3 top:7];
    [shape cube:16];
    [shape rectangularSolid:5 width:6 length:7];
    [shape circuralCylender:shape.pi radius:4 height:8];
    [shape sphere:shape.pi radius:5];
    [shape cone:shape.pi radius:4 height:2];
    
//    NSString *name = @"joo";
//    NSString *myName = [NSString stringWithFormat:@"my name is jihun", name];
//    NSString *myNameinit = [[NSString alloc] initWithFormat:<#(nonnull NSString *), ...#>]
    
    CGFloat inchToCm = [MeasurementChange inchToCm:3];
    NSLog(@"3 inch To Cm :  %lf",inchToCm);
    CGFloat cmToInch = [MeasurementChange cmToInch:3];
    NSLog(@"3 cm To Inch :  %lf",cmToInch);

    CGFloat meterToSquare = [MeasurementChange meterToSquare:42];
    NSLog(@"42 meterToSquare :  %lf",meterToSquare);
    CGFloat squareToMeter = [MeasurementChange squareToMeter:13];
    NSLog(@"133 squareToMeter :  %lf",squareToMeter);
    
    CGFloat cTof = [MeasurementChange cTof:1];
    NSLog(@"1 c To f :  %lf",cTof);
    CGFloat fToc = [MeasurementChange fToC:1];
    NSLog(@"1 f To c :  %lf",fToc);
    
    CGFloat kbToMb = [MeasurementChange kbToMb:1000];
    NSLog(@"1 kbToMb :  %lf",kbToMb);
    CGFloat gbToKb = [MeasurementChange gbToKb:1];
    NSLog(@"1 kbToMb :  %lf",gbToKb);

    NSString *grade = [IfExample pointToGrade:400];
    NSLog(@"당신의 등급은 %@입니다.",grade);

    [IfExample monthFinalDay:2];
    [IfExample absoluteNum:-300];
    [IfExample yearCheck:20000001];
    [IfExample roundNum:3.134];
    
    return 0;
}
