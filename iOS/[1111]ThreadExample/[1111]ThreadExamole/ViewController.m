//
//  ViewController.m
//  [1111]ThreadExamole
//
//  Created by celeste on 2016. 11. 11..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSThread *timeThread;
@property NSInteger threadSecond;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Queue 선언하기.
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // MainQueue
    dispatch_async(mainQueue, ^{
        for (NSInteger i=0; i<100; i++) {
            for (NSInteger j=0; j<100; j++) {
                
            }
            NSLog(@"main : %ld", i);
        }
    });
    dispatch_async(mainQueue, ^{NSLog(@"mainQueue After for");});
    
    // Global Queue
    dispatch_async(global, ^{
        for (NSInteger i=0; i<100; i++) {
            for (NSInteger j=0; j<100; j++) {
            // Empty Line
            }
            NSLog(@"global : %ld", i);
        }
    });
    dispatch_async(global, ^{NSLog(@"Global After for");});
    
    // sync & async 예제
    dispatch_queue_t queueAsync = dispatch_queue_create("com.wing.test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueAsync, ^{NSLog(@"async 예제 call 1");});
    dispatch_async(queueAsync, ^{NSLog(@"async 예제 call 2");});
    dispatch_async(queueAsync, ^{NSLog(@"async 예제 call 3");});
    dispatch_async(queueAsync, ^{NSLog(@"async 예제 call 4");});
    dispatch_async(queueAsync, ^{NSLog(@"async 예제 call 5");});
    
    // sync & async 예제
    dispatch_queue_t queueSync = dispatch_queue_create("com.wing.test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queueSync, ^{NSLog(@"sync 예제 call 1");});
    dispatch_sync(queueSync, ^{NSLog(@"sync 예제 call 2");});
    dispatch_sync(queueSync, ^{NSLog(@"sync 예제 call 3");});
    dispatch_sync(queueSync, ^{NSLog(@"sync 예제 call 4");});
    dispatch_sync(queueSync, ^{NSLog(@"sync 예제 call 5");});
    
    // dispatch_after 예제
    dispatch_queue_t afterQueue = dispatch_queue_create("com.wing.test", DISPATCH_QUEUE_CONCURRENT);
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, afterQueue, ^{NSLog(@"dispatch_after 예제 Call 1");});
    dispatch_async(afterQueue, ^{NSLog(@"dispatch_after 예제 call 2");});
    dispatch_async(afterQueue, ^{NSLog(@"dispatch_after 예제 call 3");});
    dispatch_async(afterQueue, ^{NSLog(@"dispatch_after 예제 call 4");});
    dispatch_async(afterQueue, ^{NSLog(@"dispatch_after 예제 call 5");});
    dispatch_async(afterQueue, ^{NSLog(@"dispatch_after 예제 call 6");});
    dispatch_async(afterQueue, ^{NSLog(@"dispatch_after 예제 call 7");});
    
    //dispatch_barrier_async 예제
    dispatch_queue_t barrierAsync = dispatch_queue_create("com.wing.test", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 1");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 2");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 3");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 4");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 5");});
    dispatch_barrier_sync(barrierAsync, ^{NSLog(@"------*-----");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 6");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 7");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 8");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 9");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 10");});
    dispatch_barrier_sync(barrierAsync, ^{NSLog(@"------**------");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 11");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 12");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 13");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 14");});
    dispatch_async(barrierAsync, ^{NSLog(@"dispatch_barrier_async 예제 call 15");});
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
