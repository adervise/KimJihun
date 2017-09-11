//
//  Stack.h
//  [1006]StackQueExample
//
//  Created by celeste on 2016. 10. 6..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Stack : NSObject

@property Node *header;
@property NSInteger lastIndex;

- (void)push:(NSString *)value ;
- (void)printAllNode ;
- (void)popCall;
- (void)isEmpty:(Node *)node;
- (void)emptyAllNode;

@end
