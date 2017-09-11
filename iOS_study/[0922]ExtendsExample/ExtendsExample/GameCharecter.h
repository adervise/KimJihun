//
//  GameCharecter.h
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString GameCharecterName;

/**
 * @discussion 게임캐릭터에 대한 공통 속성 및 기술에 대한 메소드
 * @author jihunKim
 * @version 0.1
 */
@interface GameCharecter : NSObject

/*! @brief 게임캐릭터 클래스 */
@property NSString *charecterClass;
/*! @brief 게임캐릭터 이름 */
@property NSString *name;
/*! @brief 게임캐릭터 사용무기*/
@property NSString *weapon;
/*! @brief 게임캐릭터 체력*/
@property NSInteger health;
/*! @brief 게임캐릭터 마나*/
@property NSInteger mana;
/*! @brief 게임캐릭터 물리공격력*/
@property NSInteger physicalPower;
/*! @brief 게임캐릭터 마법공격력*/
@property NSInteger magicalPower;
/*! @brief 게임캐릭터 생존여부*/
@property BOOL isDead;

/*!
 * @discussion 상대방에게 물리공격 메소드
 * @param someone 물리공격을 맞는 대상
 * @return nil
 */
- (id)physicalAttackT:(GameCharecterName *)someone;
- (id)physicalAttackTo:(GameCharecter *)someone;
- (id)physicalAttackToo:(NSString *)someone;
/*!
 * @discussion 상대방에게 물리공격 대상 및 피해량 메소드
 * @param someone 물리공격 맞는 대상 giveDamage 물리공격 피해량
 * @return nil
 */
- (id)physicalAttactoTo:(NSString *)someone giveDamage:(NSInteger *)damage;

/*!
 * @discussion 상대방에게 마법공격 메소드
 * @param someone 마법공격을 맞는 대상
 * @return nil
 */
- (id)magicalAttackTo:(id)someone;

/*!
 * @discussion 상대방에게 마법공격 대상 및 피해량 메소드
 * @param someone 마법공격 맞는 대상 giveDamage 마법공격 피해량
 * @return nil
 */
- (id)magicalAttactoTo:(NSString *)someone giveDamage:(NSInteger)damage;


@end
