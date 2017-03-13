//
//  Wizard.h
//  StructureExample3
//
//  Created by celeste on 2016. 9. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Warrior;
@interface Wizard : NSObject

@property NSString *name;
@property NSInteger health;
@property NSUInteger mana;
@property NSInteger physicalPower;
@property NSInteger magicalPower;
@property NSInteger magicalDamage;
@property BOOL isDead;

- (id)physicalAttackTo:(Warrior *)someCharecter;
- (id)megicalAttackTo:(Warrior *)someCharecter;
- (id)integerDamage:(NSInteger)someCharecter;
- (id)uIntegerDamage:(NSUInteger)someCharecter;
- (id)floatDamage:(CGFloat)someCharecter;
- (id)refDamage:(NSNumber *)someCharecter;
- (id)jumpTo:(NSString *)somewhere;

@end
