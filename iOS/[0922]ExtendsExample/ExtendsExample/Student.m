//
//  Student.m
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Student.h"

@implementation Student


- (id)study:(NSString *)subject {
    return nil;
}

- (id)select:(GameCharecter *)charecter {

    if(/* DISABLES CODE */ (NO)){
        [super select:charecter];
    } else {
        NSLog(@"%@ 이(가) 게임 캐릭터 %@ 클래스를 선택하였습니다. 그리고 수능을 망했습니다...", self.name, charecter.charecterClass);
        }
    return nil;
}


@end
