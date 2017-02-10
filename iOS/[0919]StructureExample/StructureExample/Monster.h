//
//  Monster.h
//  StructureExample
//
//  Created by celeste on 2016. 9. 19..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monster : NSObject

//몬스터의 크기
@property id size;

//몬스터 종족
@property id tribe;

//몬스터 레벨
@property id level;

//몬스터가 주는 아이템
@property id dropItem;

//몬스터가 주는 퀘스트
@property id giveQuest;


//몬스터가 사용자에게 사용하는 공격기술 메소드
- (id)monsterSkill;

//몬스터가 합체할 떄 사용하는 메소드
- (id)monsertFusion;

//몬스터가 동료를 호출할 때 사용하는 메소드
- (id)monsterGroup;

//몬스터를 만날 때 구성되는 던젼
- (id)monsterDungeon;

//그냥 심심해서 만들어본 메소드.
- (id)ticketMonster;

@end
