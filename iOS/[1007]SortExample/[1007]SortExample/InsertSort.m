//
//  InsertSort.m
//  [1007]SortExample
//
//  Created by celeste on 2016. 10. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "InsertSort.h"

@implementation InsertSort

- (NSArray *)insertSort:(NSArray *)list {
    
    NSMutableArray *unSortedList = [[NSMutableArray alloc] initWithArray:list];
    for (NSInteger i=1; i<unSortedList.count; i++) {
        NSInteger j = i;
        while (j>0 && [[unSortedList objectAtIndex:j-1] intValue] > [[unSortedList objectAtIndex:j]intValue]) {
            [unSortedList exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            j--;
        }
    }
    return unSortedList;
}

@end
