//
//  Stack.m
//  [1006]StackQueExample
//
//  Created by celeste on 2016. 10. 6..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Stack.h"

@implementation Stack

// 초기화
- (instancetype)init {
    self = [super init];
    if (self) {
        self.header = [[Node alloc] init];
        self.header.next = nil;
        self.header.prev = nil;
    }
    return self;
}

// push 데이터 추가
- (void)push:(NSString *)value {
    [self pushData:self.header newValue:value];
}

// push
- (void)pushData:(Node *)nowNode newValue:(NSString *)value {
    
    //noeNode의 next가 nil 이다
    if (nowNode.next == nil) {
        Node *newNode = [[Node alloc] init];
        newNode.value = value;
        newNode.prev = nowNode;
        newNode.next = nil;
        newNode.index = self.lastIndex;
        
        nowNode.next = newNode;
        self.lastIndex = self.lastIndex + 1;
        
    } else {
        [self pushData:nowNode.next newValue:value];
    }
}

// 팝 메소드 호출
- (void)popCall {
    [self pop:self.header];
}

// 팝 메소드
- (void)pop:(Node *)nowNode {
    
    if (nowNode.next == nil){
        //nowNode = lastNode
        Node *preLast = nowNode.prev;
        preLast.next = nil;
        nowNode.prev = nil;
    } else {
        [self pop:nowNode.next];
    }
}

// printNode (모든 노드의 데이터를 출력한다.)
- (void)printAllNode {
    [self printNode:self.header];
}

// 모든 데이터 출력
- (void)printNode:(Node *)node {
    NSLog(@"node.value : %@, node.index : %ld ", node.value, node.index);
    if (node.next != nil){
        [self printNode:node.next];
    }
}

- (void)emptyAllNode {
    [self isEmpty:self.header.next];
    self.header.next = nil;
}


- (void)isEmpty:(Node *)nowNode {
    
    if (nowNode.next != nil) {
        [self isEmpty:nowNode.next];
    }
    nowNode = nil;
}

@end
