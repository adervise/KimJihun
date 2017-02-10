//
//  ViewController.m
//  [1031]PrecompiledHeaderExample
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib_viewController");
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // precomfiled Header 를 등록하여 import를 하지 않아도 사용가능.
    [[MySingleton sharedInstance] justMethod];
    NSLog(@"%@",MyName);
    NSLog(@"%ld",MaxStudentCount);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
