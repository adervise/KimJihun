//
//  Student.h
//  initExample
//
//  Created by celeste on 2016. 9. 23..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Person.h"

@interface Student : Person

/*! @brief 학교 */
@property NSString *school;
/*! @brief 학급 */
@property NSInteger grade;
/*! @brief 성적 */
@property NSString *credit;

/*!
 * @discussion 학급과 관련된 메소드
 * @param name 이름
 * @param city 도시
 * @param school 학교
 * @param grade 학급
 * @param credit 성적
 * @return self
 */
- (instancetype)initWithName:(NSString *)name myCity:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade credit:(NSString *)credit ;

/*!
 * @discussion 학급과 관련된 메소드
 * @param name 이름
 * @param city 도시
 * @param school 학교
 * @param grade 학급
 * @return self
 */
- (instancetype)initWithName:(NSString *)name myCity:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade ;

@end
