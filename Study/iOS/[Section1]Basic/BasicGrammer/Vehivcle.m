//
//  Vehivcle.m
//  BasicGrammer
//
//  Created by celeste on 2016. 10. 18..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Vehivcle.h"

@implementation Vehivcle
@synthesize wheels;
@synthesize seats;

- (void)print {
    NSLog(@"wheels %i , seats : %i ", wheels, seats);
}

- (void)setWheels:(int)w Seats:(int)s {
    wheels = w;
    seats = s;
}

@end
