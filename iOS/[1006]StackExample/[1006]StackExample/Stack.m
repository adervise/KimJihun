//
//  Stack.m
//  [1006]StackExample
//
//  Created by celeste on 2016. 10. 6..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (instancetype)init {
    self = [super init];
    if (self) {
        self.header = [[Node alloc] init];
        self.header.bottom = nil;
        self.header.top = nil;
    }
    return self;
}

- (void)push:(NSString *)value {
    [self pushData:self.header newValue:value];
}

- (void)pushData:(Node *)nowNode newValue:(NSString *)value {
    
    if (self.header.top == nil) {
        Node *newNode = [[Node alloc] init];
        newNode.bottom = self.header;
        newNode.top = nil;
        newNode.value = value;
        newNode.index = self.lastIndex;
    }
}

- (void)printAllNode {
    [self printNode:self.header];
}

// 모든 데이터 출력
- (void)printNode:(Node *)node {
    NSLog(@"node.value : %@, node.index : %ld ", node.value, node.index);
    if(node.top != nil){
        [self printNode:node.next];
    }
}


@end
