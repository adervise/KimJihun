//
//  DLinkedList.m
//  [0928]ArrayExample
//
//  Created by celeste on 2016. 9. 28..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "DLinkedList.h"

@implementation DLinkedList

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


- (void)addFirstValue:(NSInteger)newValue {

    Node *newNode = [[Node alloc] init];
    newNode.value = newValue;
    
    if (self.header.next == nil) {
        self.header.next = newNode;
        newNode.prev = self.header;
        newNode.next = nil;
    } else {
        newNode.prev = self.header;
        newNode.next = self.header.next;
        self.header.next.prev = newNode;
        self.header.next = newNode;
    }
}

// 리스트의 마지막에 추가하는 방법
// add(마지막에 데이터를 추가한다.)
- (void)addLastValue:(NSInteger)value {
    [self addLastIndexNode:self.header newValue:value];
}

- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value {
    
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
        [self addLastIndexNode:nowNode.next newValue:value];
    }
}

// CALL - (void)removeLastNode:(Node *)nowNod
- (void)removeLast {
    [self removeLastNode:self.header];
}

// removeLast
- (void)removeLastNode:(Node *)nowNode {
    
    if (nowNode.next == nil){
        //nowNode = lastNode
        Node *preLast = nowNode.prev;
        preLast.next = nil;
        nowNode.prev = nil;
    } else {
        [self removeLastNode:nowNode.next];
    }
}

// count (총 노드의 개수를 구한다.)
- (void)countNode {
}


// printNode (모든 노드의 데이터를 출력한다.)
- (void)printAllNode {
    [self printNode:self.header];
}

- (void)printNode:(Node *)node {
    NSLog(@"node.value : %ld, node.index : %ld ", node.value, node.index);
    if(node.next != nil){
        [self printNode:node.next];
    }
}

@end
