//
//  Node.h
//  [0928]ArrayExample
//
//  Created by celeste on 2016. 9. 28..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property NSInteger value;

@property Node *next;
@property Node *prev;
@property Node *front;
@property NSInteger index;

@end
