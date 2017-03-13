//
//  USerSettings.m
//  [1031]NSNotificationKeyBoard
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "USerSettings.h"

@implementation USerSettings

- (void)setIsSoundOn:(BOOL)isSoundOn {
    _isSoundOn = isSoundOn;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DisSoundSettingChangedNotification object:self userInfo:@{@"KYE":@"VALUE"}];
}


@end
