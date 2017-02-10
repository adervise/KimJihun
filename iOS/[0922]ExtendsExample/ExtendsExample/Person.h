//
//  Person.h
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCharecter.h"

/**
 * @discussion 사람객체에 대한 속성, subclass : Student
 * @author jihunKim
 * @version 0.1
 */
@interface Person : NSObject

/*! @brief 이름 */
@property NSString *name;
/*! @brief 나이 */
@property NSInteger age;
/*! @brief 성별 */
@property NSString *gender;

/*!
 * @discussion 사람은 게임 캐릭터 클레스를 고를 수 있다.
 * @param charecter 게임 캐릭터
 * @return nil
 */
- (id)select:(GameCharecter *)charecter;


@end
