//
//  Wizard.m
//  StructureExample2
//
//  Created by celeste on 2016. 9. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard

// 폭풍구름
- (id)thunderStorm {
    
    Wizard *spell = [[Wizard alloc] init];
    spell.health = @500;
    spell.weapon = @"LongBow";
    spell.magicalPower =  spell.health;
    NSLog(@"hi, My class is magician, my spell power is  %@ and my weapon is %@ ",spell.magicalPower ,spell.weapon);
    return nil;
}

/*!
 * @discussion NSLog, no parameter
 * @return nil
 */
- (id)magicMisile {

    NSLog(@"The damage of magic missile 1000");
    return nil;
}

/*!
 * @discussion NSLog, 1 parameter
 * @param to 매직미사일의 대상
 * @return nil
 */
- (id)magicMisile:(id)to {
    
    NSLog(@"The damage of magic missile 1000 to %@", to);
    return nil;
}

/*!
 * @discussion NSLog, two parameter
 * @param to 매직미사일의 대상
 * @param damage 매직미사일의 공격력
 * @return nil
 */
- (id)magicMisile:(id)to damage:(id)damage {
    
    NSLog(@"The damage of magic missile %@ to %@" , damage, to);
    return nil;
}

@end
