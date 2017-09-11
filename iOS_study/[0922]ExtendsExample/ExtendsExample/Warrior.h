//
//  Warrior.h
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCharecter.h"

@interface Warrior : GameCharecter


/*!
 * @discussion 누구에게 점프할지에 대한 기능
 * @param location 점프할 대상
 * @return nil
 */
- (id)jumpTo:(NSString *)location;
- (id)smash:(GameCharecter *)someone;

@end
