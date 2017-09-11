//
//  Warrior.h
//  StructureExample2
//
//  Created by celeste on 2016. 9. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * @discussion 전사 클래스는 전사에 대한 속성과 메소드
 * @author jihunKim
 * @version 0.1
 *
 */
@interface Warrior : NSObject

/*! @brief 체력 */
@property id health;

/*! @brief 마나 */
@property id mana;

/*! @brief 신체능력 */
@property id physicalPower;

/*! @brief 지식능력 */
@property id magicalPower;

/*! @brief 무기 */
@property id weapon;

/*!
 * @discussion 일격필살에 대한 메소드
 * @param to 마법을 맞는 대상
 * @param damage 마법 데미지
 * @return nil
 */
- (id)powerAttack:(id)to damage:(id)damage;
- (id)jumpAttack;

@end
