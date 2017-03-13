//
//  Warrior.h
//  StructureExample
//
//  Created by celeste on 2016. 9. 19..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Warrior : NSObject

@property id strength;
@property id healPoint;
@property id manaPoint;
@property id agility;
@property id intelligence;

- (id) powerAttack;
- (id) speedAttack;
- (id) jumpAttack;
- (id) rollingJump;
- (id) darkSwarm;

@end
