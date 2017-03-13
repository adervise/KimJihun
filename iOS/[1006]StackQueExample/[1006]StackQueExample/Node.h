//
//  Node.h
//  [1006]StackQueExample
//
//  Created by celeste on 2016. 10. 6..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property NSString *value;
@property Node *next;
@property Node *prev;
@property Node *front;
@property NSInteger index;
@property Node *top;
@property Node *bottom;

@end
