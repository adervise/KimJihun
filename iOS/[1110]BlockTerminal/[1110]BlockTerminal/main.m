//
//  main.m
//  [1110]BlockTerminal
//
//  Created by celeste on 2016. 11. 10..
//  Copyright © 2016년 iosSchool. All rights reserved.
//
#import <Foundation/Foundation.h>



int main(int argc, const char * argv[]) {
   
    void (^doubleInteger)(NSInteger) = ^(NSInteger num){
        num *= num;
        NSLog(@"%ld", num);
    };
    
    doubleInteger(3);

    
    void (^plusInteger)(NSInteger num1, NSInteger num2) = ^(NSInteger num1, NSInteger num2){
        NSLog(@"%ld", num1 + num2);
    };
    
    plusInteger(3,5);

    
    
    
    
    
    
    
    
    return 0;
}
