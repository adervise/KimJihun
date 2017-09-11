//
//  ViewController.m
//  [1102]ProjectLoginPage
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "SignUpController.h"
#import "AfterLoginController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    NSLog(@"login");
}

- (IBAction)signUp:(id)sender {
    NSLog(@"signUp");
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {

    if ([identifier isEqualToString:@"loginSegue"]) {
        NSLog(@"loginSegue Start!!!");
        return [[DataCenter sharedManager] haveUserID:self.idTextField.text userPW:self.passwordTextField.text];
    } else if ([identifier isEqualToString:@"signUpSegue"]) {
        NSLog(@"signUpSegue Start!!!");
        return YES;
    } else {
        return YES;
    }
}


@end
