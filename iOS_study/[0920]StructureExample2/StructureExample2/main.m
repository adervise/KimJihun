//
//  main.m
//  StructureExample2
//
//  Created by celeste on 2016. 9. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

// #import <애플에서 제공해주는 헤더>, "우리가 만든 헤더"
#import <Foundation/Foundation.h>
#import "Person.h"
#import "Wizard.h"
#import "Warrior.h"

int main(int argc, const char * argv[]) {
    
    /*
        객체생성+초기화
        [[<className> alloc] init];
        객체만드는 방법 : <데이터타입> *<변수이름> = <객체의 주소>;
     */
    
    //Person 객체생성 및 초기화
    Person *me = [[Person alloc] init];
    Person *we = [[Person alloc] init];
    Person *you = [[Person alloc] init];
    
    //마법사클래스 객체생성 및 초기화
    Wizard *magic = [[Wizard alloc] init];
    Wizard *power = [[Wizard alloc] init];
    Wizard *start = [[Wizard alloc] init];
    Wizard *stop  = [[Wizard alloc] init];
    Wizard *gogo = [[Wizard alloc] init];
    Wizard *hoho = [[Wizard alloc] init];
    
    //전사클래스 객체생성 및 초기화
    Warrior *baba = [[Warrior alloc] init];
    Warrior *nana = [[Warrior alloc] init];
    Warrior *kaka = [[Warrior alloc] init];
    Warrior *jaja = [[Warrior alloc] init];
    
    //Person 객체에 대한 속성값
    me.name = @"jiHun";
    me.age = @29;
    me.weight = @82;
    we.name = @"jiHuns";
    you.name = @"hyemi";
    
    //마법사 클래스 magic 속성값
    magic.health = @300;
    magic.mana = @500;
    magic.physicalPower = @100;
    magic.magicalPower = @350;
    magic.weapon = @"sword";
    
    //마법사 클래스 power 속성값
    power.health = @320;
    power.mana = @530;
    power.physicalPower = @1100;
    power.magicalPower = @3150;
    power.weapon = @"bow";
    
    //마법사 클래스 stop 속성값
    stop.health = @3300;
    stop.mana = @5010;
    stop.physicalPower = @1050;
    stop.magicalPower = @3550;
    stop.weapon = @"axe";
    
    //전사 클래스 kaka 속성값
    kaka.health = @8300;
    kaka.mana = @5070;
    kaka.physicalPower = @1090;
    kaka.magicalPower = @3510;
    kaka.weapon = @"shortTree";
    
    //Person 속성값에 대한 로그 출력
    NSLog(@"------- 1. Person property 출력 -------");
    NSLog(@"My name is %@", me.name);
    NSLog(@"%@~ hi my name is %@",you.name, me.name);
    NSLog(@"%@! hi, My weapon is %@, and my health is %@",you.name ,power.weapon ,kaka.health);
    
    //power.weapon 속성 변경
    power.weapon = @"LongBow";
    NSLog(@"------- 2. power.weapon 속성 변경 -------");
    NSLog(@"%@! hi, My weapon is %@, and my health is %@",you.name ,power.weapon ,kaka.health);
    NSLog(@"my name is %@ and my physicalPower is %@" ,you.name, stop.physicalPower);
    
    //속성에 속성값 부여
    power.health = stop.health;
    NSLog(@"------- 3. 속성에 속성값 부여(power.health = stop.health) -------");
    NSLog(@"my power is Change %@" ,power.health);
    
    //Wizard 에 생성된 메소드 호출
    NSLog(@"------- 4. [magic thunderStorm] Method Start -------");
    [magic thunderStorm];
    
    //Person 에 생성된 [me talk] 메소드 호출
    NSLog(@"------- 5. [me talk] Method Start -------");
    [me talk];

    //Person 에 생성된 [me eat:@"사과"] 메소드 호출
    NSLog(@"------- 6. [me eat:@'사과'] Method Start -------");
    [me eat:@"사과"];

    //Person 에 생성된 [me run] 메소드 호출
    NSLog(@"------- 7. [me run] Method Start -------");
    [me run];

    //Person 에 생성된 (id)runTo:(id)you 메소드 로그출력
    NSLog(@"------- 8. (id)runTo:(id)you 매개변수1개 Start -------");
//    [me runTo:@100];
    NSLog(@"%@", [me runTo:@100]);
    
    //Person 에 생성된 - (id)runTo:(id)location bySpeed:(id)speed with:(id)someone (*매개변수를 복수로 받기)
    NSLog(@"------- 9. 매개변수2개 Start -------");
    [me runTo:@"스페인"
      bySpeed:@350];
    
    //Person 에 생성된 - (id)runTo:(id)location bySpeed:(id)speed with:(id)someone (*매개변수를 복수로 받기)
    NSLog(@"------- 10. 매개변수3개 Start -------");
    [me runTo:@"서울"
        bySpeed:@100
        with:you.name];
    
    NSLog(@"------- 11. 매개변수1개 Start -------");
    [magic magicMisile];
    
    NSLog(@"------- 12. 매개변수2개 Start -------");
    [magic magicMisile:@"dragon"];
    
    NSLog(@"------- 13. 매개변수3개 Start -------");
    [magic magicMisile:@"dragon" damage:@35000];
    
    NSLog(@"------- 14 전사와 마법사와의 싸움!!! -------");
    [magic magicMisile:@"Warrior" damage:@35000];
    [baba powerAttack:@"Wizard" damage:@34000];

    return 0;
}
