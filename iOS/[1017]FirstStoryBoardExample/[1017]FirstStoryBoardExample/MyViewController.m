//
//  MyViewController.m
//  [1017]FirstStoryBoardExample
//
//  Created by celeste on 2016. 10. 17..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myButton:(id)sender {
   
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *button = sender;
        NSLog(@"button title %@, tag %ld",[[button titleLabel]text], [button tag]);
    } else {
        NSLog(@"버튼이 아닙니다.");
    }
}

- (IBAction)sliderValueChange:(id)sender {
    
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider = sender;
        NSLog(@"slider value %f",slider.value);
    }
}

- (IBAction)sengmentChagne:(id)sender {
    
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment = sender;
        NSLog(@"segments value %ld",segment.selectedSegmentIndex);
    }
}

- (IBAction)switchChange:(id)sender {
    
    if ([sender isKindOfClass:[UISwitch class]]) {
        UISwitch *swich = sender;
        NSLog(@"swich value %d",swich.on);
    }
}

- (IBAction)sliderColorChange:(id)sender {
    
    CGFloat redValue = self.redValue.value;
    CGFloat greenValue = self.greenValue.value;
    CGFloat blueValue = self.blueValue.value;

    [self.colorView setBackgroundColor:[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1]];
}


@end
