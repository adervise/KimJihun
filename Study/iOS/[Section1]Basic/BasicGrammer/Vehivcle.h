//
//  Vehivcle.h
//  BasicGrammer
//
//  Created by celeste on 2016. 10. 18..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehivcle : NSObject

@property int wheels;
@property int seats;


- (void)print ;
- (void)setWheels:(int)w Seats:(int)s;

@end
