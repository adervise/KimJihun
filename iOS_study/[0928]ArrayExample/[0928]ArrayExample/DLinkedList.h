//
//  DLinkedList.h
//  [0928]ArrayExample
//
//  Created by celeste on 2016. 9. 28..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface DLinkedList : NSObject

@property Node *header;
@property NSInteger lastIndex;

- (void)addLastValue:(NSInteger)value ;
- (void)addFirstValue:(NSInteger)value ;
- (void)printAllNode ;
- (void)removeLast;


@end
