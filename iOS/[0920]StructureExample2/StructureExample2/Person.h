//
//  Person.h
//  StructureExample2
//
//  Created by celeste on 2016. 9. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @discussion Person Class Header
 * @author jihunKim
 * @version 0.1
 *
 */
@interface Person : NSObject

/*! @brief 이름 */
@property id name;

/*! @brief 나이*/
@property id age;

/*! @brief 몸무게 */
@property id weight;

/*! @brief 키 */
@property id height;

- (id)talk;
- (id)run;
- (id)eat:(id)food;
- (id)runTo:(id)you;
- (id)runTo:(id)location bySpeed:(id)speed;
- (id)runTo:(id)location bySpeed:(id)speed with:(id)someone;
- (NSInteger)sum:(NSInteger)number plus:(NSString *)plus;
- (id)talk:(id)someone topic:(id)topic language:(id)language;

@end
