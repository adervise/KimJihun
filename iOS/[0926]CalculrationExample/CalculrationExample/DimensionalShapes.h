//
//  DimensionalShapes.h
//  CalculrationExample
//
//  Created by celeste on 2016. 9. 26..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @discussion 도형의 넓이 구하기
 * @author KimJihun
 * @version 0.1
 */
@interface DimensionalShapes : NSObject


/*! @brief 가로 */
@property NSInteger width;
/*! @brief 세로 */
@property NSInteger length;
/*! @brief 높이 */
@property NSInteger height;
/*! @brief 파이 */
@property CGFloat pi;
/*! @brief 원의 둘레 */
@property NSInteger radius;
/*! @brief 밑변 */
@property NSInteger base;
/*! @brief 윗변 */
@property NSInteger top;

/*!
 * @discussion 정사각형의 넓이
 * @param length 길이
 * @return 정사각형 넓이 공식
 */
- (NSInteger)squareArea:(NSInteger)length;

/*!
 * @discussion 정사각형의 둘레
 * @param length 길이
 * @return 정사각형 둘레 공식
 */
- (NSInteger)squarePrimeter:(NSInteger)length;

/*!
 * @discussion 직사각형 넓이
 * @param height 세로 width 높이
 * @return 직사각형 넓이 공식
 */
- (NSInteger)rectangleArea:(NSInteger)height width:(NSInteger)width;

/*!
 * @discussion 직사각형 둘레
 * @param height 세로
 * @param width 높이
 * @return 직사각형 둘레 공식
 */
- (NSInteger)rectanglePrimeter:(NSInteger)height width:(NSInteger)width;

/*!
 * @discussion 원의 넓이
 * @param radius 반지름 pi 3.14
 * @return 원의 넓이 공식
 */
- (NSInteger)circleArea:(NSInteger)radius pi:(CGFloat)pi;

/*!
 * @discussion 원의 둘레
 * @param radius 반지름 pi 3.14
 * @return 원의 둘레 공식
 */
- (NSInteger)circlePrimeter:(NSInteger)radius pi:(CGFloat)pi;

/*!
 * @discussion 삼각형의 넓이
 * @param base 밑변 height 높이
 * @return 삼각형의 넓이 공식
 */
- (NSInteger)triangleArea:(NSInteger)base height:(NSInteger)height;

/*!
 * @discussion 사다리꼴의 넓이
 * @param base 밑변 top 윗변 height 높이
 * @return 사다리꼴의 넓이 공식
 */
- (NSInteger)trapezoid:(NSInteger)height base:(NSInteger)base top:(NSInteger)top;

/*!
 * @discussion 큐브의 넓이
 * @param length 길이
 * @return 큐브의 넓이 공식
 */
- (NSInteger)cube:(NSInteger)length;

/*!
 * @discussion 벽돌의 넓이
 * @param height 높이 width 가로 length 세로
 * @return 삼각형의 넓이 공식
 */
- (NSInteger)rectangularSolid:(NSInteger)height width:(NSInteger)width length:(NSInteger)length;

/*!
 * @discussion 원통의 넓이
 * @param pi 3.14 radius 원의 반지름 height 높이
 * @return 원통의 넓이 공식
 */
- (NSInteger)circuralCylender:(CGFloat)pi radius:(NSInteger)radius height:(NSInteger)height;

/*!
 * @discussion 구의 넓이
 * @param pi 3.14 radius 원의 반지름
 * @return 구의 넓이 공식
 */
- (NSInteger)sphere:(CGFloat)pi radius:(NSInteger)radius;

/*!
 * @discussion 삼각뿔의 넓이
 * @param pi 3.14 radius 원의 반지름 height 높이
 * @return 삼각뿔의 넓이 공식
 */
- (NSInteger)cone:(CGFloat)pi radius:(NSInteger)radius height:(NSInteger)height;

@end
