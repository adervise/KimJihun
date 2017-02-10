//
//  Wizard.h
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCharecter.h"

@interface Wizard : GameCharecter

- (id)teleportTo:(NSString *)location;
- (id)magicMisile:(GameCharecter *)someone;

@end
