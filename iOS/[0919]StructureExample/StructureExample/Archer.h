//
//  Archer.h
//  StructureExample
//
//  Created by celeste on 2016. 9. 19..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Archer : NSObject

@property id arrow;
@property id agility;
@property id speed;
@property id accuracy;
@property id penetration;

- (id)magicArrow;
- (id)penetrationAttack;
- (id)thunderArrow;
- (id)darkShot;
- (id)magnumShooting;

@end
