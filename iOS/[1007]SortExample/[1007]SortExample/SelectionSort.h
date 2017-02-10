//
//  SelectionSort.h
//  [1007]SortExample
//
//  Created by celeste on 2016. 10. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectionSort : NSObject

@property NSInteger totalSwitchCount;
@property NSInteger totalCompareCount;

- (NSArray *)sort:(NSArray *)list;

@end
