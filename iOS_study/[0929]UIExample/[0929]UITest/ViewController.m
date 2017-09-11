//
//  ViewController.m
//  [0929]UITest
//
//  Created by celeste on 2016. 9. 29..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //객체 생성
    UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(15, 15, self.view.frame.size.width-30, self.view.frame.size.height-30)];
    
    newView.backgroundColor = [UIColor redColor];
    [self.view addSubview:newView] ;
    
    UIView *newSubView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, newView.frame.size.width-30, newView.frame.size.height-30)];
    newSubView.backgroundColor = [UIColor blackColor];
    [newView addSubview:newSubView];
    
    UIView *newThirdView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, newSubView.frame.size.width-30, newSubView.frame.size.height-30)];
    newThirdView.backgroundColor = [UIColor orangeColor];
    [newSubView addSubview:newThirdView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
