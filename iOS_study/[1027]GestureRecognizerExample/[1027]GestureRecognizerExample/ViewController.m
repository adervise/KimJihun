//
//  ViewController.m
//  [1027]GestureRecognizerExample
//
//  Created by celeste on 2016. 10. 27..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  /* UITapGestureRecognizer Method 로 생성
    UITapGestureRecognizer *tabGesture = [[UITapGestureRecognizer alloc] init];
    [self.view addGestureRecognizer:tabGesture];
   */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickView:(UITapGestureRecognizer *)sender {
    
    static NSInteger totalCount = 0;
    CGPoint nowPoint = [self.gestureRecognizer locationInView:self.view];
    NSLog(@"%.lf %.lf", nowPoint.x, nowPoint.y);
    NSLog(@"%@", NSStringFromCGPoint(nowPoint));

    self.coordinateText.text = [NSString stringWithFormat:@"%.lf %.lf", nowPoint.x, nowPoint.y];
    self.clickCount.text = [NSString stringWithFormat:@"%ld", totalCount++];
}

@end
