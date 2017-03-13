//
//  Warrior.m
//  StructureExample2
//
//  Created by celeste on 2016. 9. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Warrior.h"

@implementation Warrior

//일격필살 메소드
- (id)powerAttack:(id)to damage:(id)damage {
    
    NSLog(@"Warrior attack to %@ and give damage %@", to, damage);
    return nil;
}

//점프공격 메소드
- (id)jumpAttack {
    return nil;
}

@end
