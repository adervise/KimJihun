//
//  GameCharecter.m
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "GameCharecter.h"

@interface GameCharecter()
@end

@implementation GameCharecter


//Q. 왜 메인에서 bini.name로 넘겨줬을 때, someone.name 으로 받으면 오류가 날까...? 그냥 언어적 특성??
- (id)physicalAttackT:(GameCharecterName *)someone{
    NSLog(@"testT %@",someone);
    return nil;
}

- (id)physicalAttackTo:(GameCharecter *)someone{
    NSLog(@"testTo %@",someone.name);
    return nil;
}

- (id)physicalAttackToo:(NSString *)someone {
    NSLog(@"testToo, %@",someone);
    return nil;
}

- (id)magicalAttactoTo:(NSString *)someone giveDamage:(NSInteger)damage {
    NSLog(@"%@, %ld", someone, damage);
    return nil;
}


@end
