//
//  main.m
//  [1006]StackQueExample
//
//  Created by celeste on 2016. 10. 6..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

int main(int argc, const char * argv[]) {
    
    Stack *list = [[Stack alloc] init];
    NSLog(@"***** Push Start   ******");
    [list push:@"10"];
    [list push:@"11"];
    [list push:@"12"];
    [list push:@"9"];
    [list push:@"test"];
    [list printAllNode];
    
    NSLog(@"***** Pop Start   ******");
    [list popCall];
    [list printAllNode];

    NSLog(@"***** Empty Start   ******");
    [list emptyAllNode];
    [list printAllNode];

    
//    NSMutableArray *array = [NSMutableArray array];
//    NSString *str = @"hello";
//    for (NSInteger i = 0; i < [str length]; i++) {
//        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
//        [array addObject:ch];
//    }
//    
//    NSLog(@"%@", array);
    
    return 0;
}
