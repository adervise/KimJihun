//
//  Warrior.h
//  StructureExample3
//
//  Created by celeste on 2016. 9. 21..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Wizard;
@interface Warrior : NSObject

@property NSString *name;
@property NSInteger health;
@property NSUInteger mana;
@property NSInteger physicalPower;
@property NSInteger magicalPower;
@property NSInteger magicalDamage;
@property BOOL isDead;

- (id)physicalAttackTo:(Wizard *)someCharecter;
- (id)megicalAttackTo:(Wizard *)someCharecter;
- (id)integerDamage:(NSInteger *)someCharecter;
- (id)uIntegerDamage:(NSUInteger *)someCharecter;
- (id)floatDamage:(CGFloat *)someCharecter;
- (id)refDamage:(NSNumber *)someCharecter;
- (id)jumpTo:(NSString *)somewhere;
- (id)floatDamage:(CGFloat *)someCharecter returnDamage:(CGFloat *)returnDamage;

@end
