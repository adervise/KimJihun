//
//  main.m
//  [1007]SortExample
//
//  Created by celeste on 2016. 10. 7..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectionSort.h"
#import "InsertSort.h"
#import "BubbleSort.h"
#import "MergeSort.h"

int main(int argc, const char * argv[]) {
    
    NSMutableArray *ranList = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<5; i++) {
        NSInteger ran = arc4random_uniform(100);
        [ranList addObject:[NSNumber numberWithInteger:ran]];
        NSLog(@"%ld이",ran);
    }
    
    //SelectionSort
    NSLog(@"***** SelectionSort Start *****");
    NSArray *sData = @[@1, @17, @51, @3, @31, @89];
    SelectionSort *sSort = [[SelectionSort alloc] init];
    NSArray *sortedList = [sSort sort:sData];
    NSLog(@"%@",sortedList);
    NSLog(@"총 비교회수는 %ld번이고 교환 횟수는 %ld번 입니다.",sSort.totalCompareCount, sSort.totalSwitchCount);
    
    //insertSort
    NSLog(@"***** insertSort Start *****");
    NSArray *iData = @[@5, @3, @7, @1, @6, @9, @2];
    InsertSort *iSort = [[InsertSort alloc] init];
    NSArray *isortedList = [iSort insertSort:iData];
    NSLog(@"%@",isortedList);
    
    //BubbleSort
    NSLog(@"***** BubbleSort Start *****");
    NSArray *bData = @[@5, @3, @7, @1, @6, @9, @2];
    BubbleSort *bSort = [[BubbleSort alloc] init];
    NSArray *bsortedList = [bSort bubbleSort:bData];
    NSLog(@"%@",bsortedList);

    //MergeSort
    NSLog(@"***** MergeSort Start *****");
    NSArray *mData = @[@5, @3, @7, @1, @6, @9, @2];
    MergeSort *mSort = [[MergeSort alloc] init];
    NSArray *msortedList = [mSort mergeSort:mData];
    NSLog(@"%@",msortedList);
    
    return 0;
}
