//
//  ViewController.m
//  [1111]ThreadExampleByJYM
//
//  Created by celeste on 2016. 11. 11..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

//0 is Thread, 1 is GCD
// 이런 코딩은 나중에 user setting 을 저장할 때 사용하기도 한다.
static const BOOL useGCD = YES;

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *timeLb;

////Thread
@property (nonatomic, strong) NSThread *timeThread;
@property (nonatomic, assign) NSInteger threadSecond;

//gcd
@property (nonatomic) dispatch_source_t timer;
@property (nonatomic, assign) __block NSInteger gcdSecond;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (useGCD) {
        //GCD
        self.gcdSecond = 0;
    } else {
        self.threadSecond = 0;
    }
    //    NSTimer 로 편하기 구현할 수 도 있다...
    //    [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {NSLog(@"TEST");}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Main Action
- (void)changeText:(NSNumber *)second {
    NSInteger sec = second.integerValue;
    [self.timeLb setText:[NSString stringWithFormat:@"%ld",(long)sec]];
}


- (IBAction)controlBtnAction:(UIButton *)sender {
    if (sender.selected) {//stop
        sender.selected = NO;
        
        if (useGCD) {
            [self stopForGCD];
        } else {
            [self stopForThread];
        }
    } else {
        //play
        sender.selected = YES;
        if (useGCD) {
            //GCD
            [self startForGCD];
        } else {
            [self startTime];
        }
    }
    
}


#pragma Thread
//on main Thread
- (void)startTime {
    if (self.timeThread == nil) {
        self.timeThread = [[NSThread alloc] initWithTarget:self
                                        selector:@selector(startThread)
                                        object:nil];
        [self.timeThread start];
    }
}
//on another Thread
- (void)startThread {
    while (!self.timeThread.cancelled) {
        //change the text in the label on the main thread:
        [self performSelectorOnMainThread:@selector(changeText:)
                withObject:[NSNumber numberWithInteger:self.threadSecond]
                waitUntilDone:NO];
        
        sleep(1);
        self.threadSecond++;
    }
    self.timeThread = nil;
}


- (void)stopForThread {
    [self.timeThread cancel];
}


#pragma GCD
- (void)startForGCD {
    if (self.timer == nil) {
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
        dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1* NSEC_PER_SEC);
        dispatch_source_set_event_handler(self.timer, ^{
            [self changeText:[NSNumber numberWithInteger:self.gcdSecond]];
            self.gcdSecond++;
        });
        dispatch_resume(self.timer);
        
    } else {
        dispatch_resume(self.timer);
    }
}


- (void)stopForGCD {
    dispatch_suspend(self.timer);
}


@end
