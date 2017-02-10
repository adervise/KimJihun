//
//  main.m
//  [0928]ArrayExample
//
//  Created by celeste on 2016. 9. 28..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLinkedList.h"

int main(int argc, const char * argv[]) {
    
    DLinkedList *list = [[DLinkedList alloc] init];
    
    [list addLastValue:10];
    [list addLastValue:11];
    [list addLastValue:12];
    [list addLastValue:13];
    [list printAllNode];
    NSLog(@"***** addFirstValue   ******");
    [list addFirstValue:5];
    [list printAllNode];
    [list removeLast];
    NSLog(@"*****   printAllNode   ******");
    [list printAllNode];

    return 0;
}
