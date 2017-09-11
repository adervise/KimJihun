//
//  Student.h
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Person.h"


/**
 * @discussion 학생에 대한 속성 및 메소드, ParentClass : Person, 
 * @author jihunKim
 * @version 0.1
 */
@interface Student : Person

/*! @brief  학년 */
@property NSInteger grade;
/*! @brief  학교이름 */
@property NSString *schoolName;
/*! @brief  과목 */
@property NSString *subject;
/*! @brief 점수 */
@property NSInteger score;

/*!
 * @discussion 공부에 대한 메소드
 * @return id
 */
- (id)study:(NSString *)subject;

/*!
 * @discussion select 대한 오버라이딩
 * @return id
 */
- (id)select:(GameCharecter *)charecter;

@end
