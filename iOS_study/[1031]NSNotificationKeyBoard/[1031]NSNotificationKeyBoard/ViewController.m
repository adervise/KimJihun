//
//  ViewController.m
//  [1031]NSNotificationKeyBoard
//
//  Created by celeste on 2016. 10. 31..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (IBAction)tabBackground:(id)sender {
    for (UIView *subview in [[self view] subviews]) {
        if ([subview isFirstResponder]) {
            [subview resignFirstResponder];
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveKeyboardChangeNotification:)
                                    name:UIKeyboardDidShowNotification
                                    object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveKeyboardChangeNotification:)
                                    name:UIKeyboardDidHideNotification
                                    object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveKeyboardChangeNotification:)
                                    name:UIKeyboardDidChangeFrameNotification
                                    object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                    selector:@selector(didReceiveSettingChange:)
                                    name:@"textSetting"
                                    object:nil];
}

- (void)didReceiveSettingChange:(NSNotification *)noti {
    
    UIColor *color = [[noti userInfo] objectForKey:@"color"];
    UIFont *font = [[noti userInfo] objectForKey:@"font"];
    
    NSLog(@"%@",color);
    NSLog(@"%@",font);
    
    [self.labelResult setTextColor:color];
    [self.labelResult setFont:font];
    NSLog(@"%@",color);
    NSLog(@"%@",font);
}


- (void)didReceiveKeyboardChangeNotification:(NSNotification *)noti {
    
    NSLog(@"%@", noti);
    
    if ([[noti name] isEqualToString:UIKeyboardDidShowNotification]) {
        [[self stateLabel] setText:@"키보드 있음"];
    } else if ([[noti name] isEqualToString:UIKeyboardDidHideNotification]) {
        [[self stateLabel] setText:@"키보드 없음"];
    }
    
    if ([[noti name] isEqualToString:UIKeyboardDidChangeFrameNotification]) {
        NSValue *frameValue = [[noti userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
        
        if ([frameValue isKindOfClass:[NSValue class]]) {
            
            CGRect keyboardFrame = [frameValue CGRectValue];
            
            NSString *frameString = NSStringFromCGRect(keyboardFrame);
            
            [[self frameLabel] setText:frameString];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.\
    
    
}


- (IBAction)sliderChange:(id)sender {
    CGFloat redValue = self.redValue.value;
    CGFloat greenValue = self.greenValue.value;
    CGFloat blueValue = self.blueValue.value;
    [self.labelValue setTextColor:[UIColor
                                colorWithRed:redValue
                                green:greenValue
                                blue:blueValue
                                alpha:1]];
}

- (IBAction)segmentChange:(id)sender {
    
    if (self.textSizeValue.selectedSegmentIndex == 0) {
        [self.labelValue setFont:[UIFont systemFontOfSize:12]];
    }
    
    if (self.textSizeValue.selectedSegmentIndex == 1) {
        [self.labelValue setFont:[UIFont systemFontOfSize:16]];
    }

    if (self.textSizeValue.selectedSegmentIndex == 2) {
        [self.labelValue setFont:[UIFont systemFontOfSize:20]];
    }
}

- (IBAction)saveSetting:(id)sender {
    
    NSDictionary *userInfo = @{@"font" : self.labelValue.font,
                            @"color" : self.labelValue.textColor};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"textSetting"
                                    object:self
                                    userInfo:userInfo];
    
    [self.navigationController popViewControllerAnimated:YES];;
}


@end
