//
//  ViewController.m
//  [Section5]SignUpScreen
//
//  Created by celeste on 2016. 10. 10..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nameTextField, idTextField, passwdTextField, telTextField, blogTextFiled, resultText;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    nameTextField.delegate = self;
//    idTextField.delegate = self;
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UIResponder
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)signUpAction:(id)sender {
    
    resultText.text = [NSString stringWithFormat:@"%@ 님 가입을 축하드립니다.", nameTextField.text];
}


@end
