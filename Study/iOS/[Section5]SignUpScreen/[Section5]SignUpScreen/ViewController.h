//
//  ViewController.h
//  [Section5]SignUpScreen
//
//  Created by celeste on 2016. 10. 10..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UITextField *idTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwdTextField;

@property (strong, nonatomic) IBOutlet UITextField *telTextField;

@property (strong, nonatomic) IBOutlet UITextField *blogTextFiled;

@property (strong, nonatomic) IBOutlet UITextView *resultText;


- (IBAction)signUpAction:(id)sender;


@end

