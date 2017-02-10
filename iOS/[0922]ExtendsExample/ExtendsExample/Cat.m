//
//  Cat.m
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (id)cryTo:(Person *)someone {
    NSLog(@"동물 %@가 %@에게 %@ 라며 짖었습니다.", self.name, someone.name, self.cry);
    return nil;
}

@end
