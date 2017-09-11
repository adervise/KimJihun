//
//  ViewController.m
//  [0930]SlotMachine
//
//  Created by celeste on 2016. 9. 30..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 350, 50)];
    [label1 setText:@"예제 화면 입니다."];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 350, 50)];
    [label2 setText:@"예쁜 레이블 입니다."];
    [label2 setTextColor:[UIColor redColor]];
    [label2 setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:label2];
    
    UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(20, 140, 180, 180)];
    newView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:newView];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(newView.bounds.size.height-150, newView.bounds.size.width-50, 150 , 50)];
    [label3 setText:@"view 위에 레이블입니다."];
    [label3 setTextColor:[UIColor whiteColor]];
    [label3 setTextAlignment:NSTextAlignmentRight];
    [newView addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-125, self.view.center.y, 250, 50)];
    [label4 setText:@"중앙에 있는 레이블 입니다."];
    [label4 setBackgroundColor:[UIColor yellowColor]];
    [label4 setTextColor:[UIColor redColor]];
    [label4 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-125, self.view.center.y+50, 250, 50)];
    [label5 setText:@"폰트가 20입니다."];
    [label5 setTextColor:[UIColor blackColor]];
    [label5 setTextAlignment:NSTextAlignmentCenter];
    [label5 setFont:[UIFont systemFontOfSize:20]];
    [self.view addSubview:label5];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
