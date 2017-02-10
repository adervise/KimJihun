//
//  BroadcastStation.h
//  [1108]PropertAttributes
//
//  Created by celeste on 2016. 11. 8..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Musician;

@interface BroadcastStation : NSObject

//@property (unsafe_unretained) Musician *musician;
@property (retain) Musician *musician;

@end
