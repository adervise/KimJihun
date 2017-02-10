//
//  main.m
//  StructureExample3
//
//  Created by celeste on 2016. 9. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"
#import "Cat.h"
#import "Dog.h"


int main(int argc, const char * argv[]) {
    
    /*! @brief 불리언 타입 : 김지훈은 잘생겼는가? YES */
    BOOL isJihunKimHandsome = YES;
    BOOL compareResult = NO;
    
    //1. 정수타입, 값타입, 벨류타입
    //1.1 부호가 있는 정수타입
    NSInteger signedInteger = -100;
    NSInteger twoHundred = 200 ;
    
    //1.2 부호가 없는 정수타입
    NSUInteger unsignedInteger = 100;
    NSUInteger threeHundred = 300;
    
    compareResult = (twoHundred < threeHundred);
    
    //1.3 값타입의 경우 각각의 다른 번지에 매핑된 결과들을 가지고 출력
    NSInteger anotherNumber = twoHundred;
    anotherNumber = 1000;
    
    //2.객체형 숫자 타입
    //2.1 레퍼런스 타입, 참조타입
    NSNumber *someNumberObject = @100; // @100 => [[NSNumber alloc] initWithInt:100];
    NSNumber *anotherNumberVariable = someNumberObject;
    
    //3. 실수형타입
    CGFloat height2 = 174.1;
    CGFloat Wheight = 81.8;
    
    //4. 한 글자 표현 문자 타입
    char someCharacter = 'a';
    
    Warrior *jack = [[Warrior alloc] init];
    jack.name = @"전사로 태어났지만 검소한 녀석 but Handsome"; // => [[NSString alloc] initWithUTF8String:"전사"]
    jack.health = 200;
    jack.mana = 50;
    jack.physicalPower = 10;
    jack.magicalPower = 124.4;
    jack.magicalDamage = 124.4;
    jack.isDead = NO;
    
    // 형식지정자 - format specifiers
    // 정수타입 - 부호가 있는 32bit 정수타입 > 10진수 (%d)
    // 정수타입 - 부호가 있는 64bit 정수타입 > 10진수 (%ld)
    NSLog(@"Signed 64bit integer : %ld", jack.physicalPower);
    
    // 정수타입 - 부호가 없는 32bit 정수타입 > 10진수 (%u)
    // 정수타입 - 부호가 없는 64bit 정수타입 > 10진수 (%lu)
   
    NSLog(@"Unsigned 64bit integer : %lu", jack.physicalPower); //underflow 현상이 일어난다.
    
    NSInteger jackTest = -10;
    NSLog(@"Unsigned 64bit integer : %lu", jackTest); //underflow 현상이 일어난다.
    
    //overflow 현상이 일어난다.
    jack.health = UINT_MAX + 1;
    NSLog(@"health : %lu", jack.health);
    jack.health = 200;
    
    // 실수타입 - 32bit 실수타입 (%f)
    // 실수타입 - 64bit 실수타입 (%lf)
    CGFloat height = 174.1;
    NSLog(@"CGFloat : %lf", height);
    // 불리언
    NSLog(@"Boolean value YES : %d", YES);
    NSLog(@"Boolean value NO : %d", NO);
    
    //%를 표현하고 싶을 때
    NSLog(@"공격력이 50%% 증가하였습니다.");
    
    //주소값을 보고싶어요
    NSLog(@"Jack object : %@, memory address : %p", jack, jack);
    
    //정수타입 (8진수)
    NSLog(@"health 8진수 : %lo", jack.mana);
    
    //정수타입 (16진수)
    NSLog(@"health 16진수 : %lx", jack.mana);
    
    //캐릭터 타입
    NSLog(@"health 16진수 : %c %c %c", 'a', 'b', 'c');
    
    //줄바꿈
    NSLog(@"줄을 바꿔 \n 봅시다" );
    
    //탭을 표현하고 싶어요
    NSLog(@"테테테텥텝을 하고 \t 시퍼어어어어어어어" );
    
    
    NSLog(@"JACK의 체력안 %lu\t 마력은 %lu이고, \n물리공격력은 %ld, 마법공격력은 %ld입니다.",
          jack.health, jack.mana, (long)jack.physicalPower, jack.magicalPower);

    Warrior *pack = [[Warrior alloc] init];
    pack.name = @"전사"; // => [[NSString alloc] initWithUTF8String:"전사"]
    pack.health = 200;
    pack.mana = 50;
    pack.physicalPower = 70;
    pack.magicalPower = 100;
    pack.magicalDamage = 15;
    pack.isDead = NO;
    
    Wizard *rose = [[Wizard alloc] init];
    rose.name = @"마법사";
    rose.health = 100;
    rose.mana = 150;
    rose.physicalPower = 30;
    rose.magicalPower = 150;
    rose.magicalDamage = 75;
    rose.isDead = NO;
    
    Wizard *rose2 = [[Wizard alloc] init];
    
    NSLog(@"--------------1------------");
    [pack physicalAttackTo:rose];
    
    
    NSLog(@"---------------2-----------");
    [pack physicalAttackTo:rose2];
    
    NSLog(@"---------------3-----------");
    Warrior *rack = [[Warrior alloc] init];
    [rack physicalAttackTo:rose];
    
    Cat *nabi = [[Cat alloc] init];
    nabi.name = @"나는 낭만 고양이~~~";
    nabi.age = 3;
    
    Dog *bini = [[Dog alloc] init];
    bini.name = @"나는 비숑프리제~~~빈이야 보고싶당";
    bini.age = 5;
    
    [nabi cryTo:bini];
    
    NSLog(@"---------------NSArray-----------");
    [nabi cryToo:@"test"];
    
    return 0;
}
