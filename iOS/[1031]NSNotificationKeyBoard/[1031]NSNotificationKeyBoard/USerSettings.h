//
//  USerSettings.h
//  [1031]NSNotificationKeyBoard
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSNotificationName DisSoundSettingChangedNotification = @"SoundsSetting";

@interface USerSettings : NSObject

@property BOOL isSoundOn;
@property BOOL isVibrateOn;

@end
