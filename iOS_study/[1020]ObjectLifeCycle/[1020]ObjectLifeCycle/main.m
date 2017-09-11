//
//  main.m
//  [1020]ObjectLifeCycle
//
//  Created by celeste on 2016. 10. 20..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {

    MyClass *instance = [[MyClass alloc] init];
    NSLog(@"%@",instance);
    instance = nil;
    [MyClass new];
    NSLog(@"END");
    
    return 0;
}
