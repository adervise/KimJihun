//
//  Warrior.m
//  StructureExample3
//
//  Created by celeste on 2016. 9. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"

@implementation Warrior

- (id)physicalAttackTo:(Wizard *)someCharecter {
    // 전사의 물리 공격력 만큼 마법사의 체력을 감소시킵니다.

    //마법사의 이전 체력
    NSUInteger originHealth = someCharecter.health;

    //공격
    someCharecter.health = originHealth - self.physicalPower;
    
    // 물리공격력 self.physicalPower
    NSLog(@"%@ 의 물리 공격력은 %ld 입니다.", self.name, self.physicalPower);
    
    //마법사의 이후 체력
    NSLog(@"%@ 가 공격 데미지 %ld 를 받고 남은 체력은 %ld 입니다.", someCharecter.name, self.physicalPower, someCharecter.health);
    
    // 전사가 마법사에게 물리공격을 가하여 XX만큼의 데미지를 입혔습니다.
    NSLog(@"%@가 %@에게 물리공격을 가하여 %ld만큼의 데미지를 입혔습니다.", self.name, someCharecter.name, self.physicalPower );
    
    // 마법사의 체력이 XX에서 XX으로 변경되었습니다.
    NSLog(@"%@의 체력이 %ld에서 %ld으로 변경되었습니다.", someCharecter.name, originHealth, someCharecter.health);
    
    NSLog(@"%ld",someCharecter.health);
    
    if((someCharecter.health < 0)) {
        someCharecter.isDead = YES;
        NSLog(@"DEAD : %d", someCharecter.isDead);
    } else {
        someCharecter.isDead = NO;
        NSLog(@"ALIVE : %d", someCharecter.isDead);
    }
    return nil;
}

@end
