//
//  ViewController.m
//  [1125]TargetExample
//
//  Created by celeste on 2016. 11. 25..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

#ifdef DEBUG
    NSLog(@"%@",[[NSProcessInfo processInfo] operatingSystemVersion]);
    NSLog(@"%@",[[NSProcessInfo processInfo] operatingSystemVersionString]);
    NSLog(@"%@",[[UIDevice currentDevice] systemVersion]);
#endif
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
