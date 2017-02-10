//
//  main.m
//  BasicGrammer
//
//  Created by celeste on 2016. 10. 16..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vehivcle.h"

int main(int argc, const char * argv[]) {
    
    Vehivcle *hello = [[Vehivcle alloc] init];

    [hello setWheels:2 Seats:4];
    NSLog(@"1. wheels : %i , seats : %i",hello.wheels, hello.seats);

    // if 문법
    if (hello.wheels == 4) {
        NSLog(@"if !!! wheels count 4!");
    } else if (hello.wheels == 3) {
        NSLog(@"if !!! wheels count 3 ");
    } else {
        NSLog(@"if !!! wheels count 2 is right!! ");
    }
    
    // switch 문법
    switch (hello.seats) {
        case 2:
            NSLog(@"switch!!! %i", hello.seats);
            break;
        case 3:
            NSLog(@"switch!!! %i", hello.seats);
            break;
        default:
            NSLog(@"switch!!! count is %i", hello.seats);
            break;
    }
    
    // for 문법
    for (int i=0; i<hello.wheels; i++) {
        NSLog(@"for !!! wheels %i ",i);
    }
    
    // while 문법
    int i=0;
    while (i<hello.wheels) {
        NSLog(@"while !!! wheels %i ",i);
        i++;
    }
    
    hello.wheels = 4;
    hello.seats = 2;
    NSLog(@"2. wheels : %i , seats : %i",hello.wheels, hello.seats);
    
    return 0;
}
