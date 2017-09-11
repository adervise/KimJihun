//
//  BubbleSort.m
//  [1007]SortExample
//
//  Created by celeste on 2016. 10. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.


#import "BubbleSort.h"

@implementation BubbleSort

- (NSArray *)bubbleSort:(NSArray *)list {
    
    NSMutableArray *unSortedList = [[NSMutableArray alloc] initWithArray:list];
    
    for (NSInteger i=0; i<unSortedList.count; i++) {
        for (NSInteger j=0; j<unSortedList.count-1; j++) {
            if ([[unSortedList objectAtIndex:j] intValue] > [[unSortedList objectAtIndex:(j + 1)] intValue]) {
                int temp = [[unSortedList objectAtIndex:j] intValue];
                [unSortedList replaceObjectAtIndex:j withObject:[unSortedList objectAtIndex:(j + 1)]];
                [unSortedList replaceObjectAtIndex:(j + 1) withObject:[NSNumber numberWithInt:temp]];
            }
        }
    }
    return unSortedList;
}

@end
