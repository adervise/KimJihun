//
//  Healer.h
//  StructureExample
//
//  Created by celeste on 2016. 9. 19..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Healer : NSObject

@property id aggressive;
@property id healing;
@property id defensive;
@property id attack;
@property id damage;

- (id)healingPack;
- (id)godBless;
- (id)godRage;
- (id)revival;
- (id)summonAngel;

@end
