//
//  Wizard.h
//  StructureExample2
//
//  Created by celeste on 2016. 9. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @discussion 설명
 * @author jihunKim
 * @version 0.1
 *
 */
@interface Wizard : NSObject

/*! @brief 체력 속성 값 */
@property id health;

//정신에너지
@property id mana;

//근력
@property id physicalPower;

//정신력
@property id magicalPower;

//무기
@property id weapon;

// 파이어볼 함수
- (id)fireBall;

//번개구름ㅋㅋㅋ
- (id)thunderStorm;

// 매직미사일
- (id)magicMisile;
- (id)magicMisile:(id)to;
- (id)magicMisile:(id)to damage:(id)damage;

@end
