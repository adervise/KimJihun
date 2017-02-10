//
//  LoginViewController.m
//  [1017]FirstStoryBoardExample
//
//  Created by celeste on 2016. 10. 17..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginResult:(id)sender {
    
    self.resultLabel.text = [NSString stringWithFormat:@"ID : %@  PD : %@", self.idText.text, self.passwdText.text ];
}

- (IBAction)clickAutoLogin:(id)sender {
    
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *autoLoginButton = (UIButton *)sender;
        [autoLoginButton setSelected:![autoLoginButton isSelected]];
        //BOOL currentSelectedStata = [[autoLonginButton isSeleeted];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField endEditing:YES];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    NSLog(@"test");
    return YES;
}


@end
